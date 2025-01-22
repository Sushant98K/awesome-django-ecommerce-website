
from django.shortcuts import render, redirect
from django.core.mail import send_mail
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.conf import settings
from datetime import datetime
from .models import *
from userprofile.models import *
from django.http import JsonResponse
import razorpay


# Add to Cart function
@login_required
def addToCart(request):
    user = request.user
    prodId = request.GET.get('prodId')
    product = Product.objects.get(id=prodId)
    
    # Check if product already in cart for the user
    cart_item = Cart.objects.filter(user=user, product=product).first()
    if cart_item:
        # If already in cart, increment quantity
        cart_item.quantity += 1
        cart_item.save()
    else:
        # If not in cart, add new item
        Cart(user=user, product=product).save()
    
    return redirect('show_cart')

# Show Cart function
@login_required
def showCart(request):
    user = request.user
    cart = Cart.objects.filter(user=user)
    amount = 0
    for i in cart:
        value = i.quantity * i.product.discounted_price
        amount += value
    totalamount = amount + 50
    toast_message = request.session.pop('toast_message', '')
    return render(request, 'cart.html', locals())


def cartSummary(request):
    user = request.user
    cart_items = Cart.objects.filter(user=user)
    subtotal = sum(item.quantity * item.product.discounted_price for item in cart_items)
    shipping = 50  # Fixed shipping cost
    total = subtotal + shipping

    return JsonResponse({
        'subtotal': subtotal,
        'total': total
    })


# Update Cart Quantity function (AJAX request)
def updateCartQuantity(request):
    cart_id = request.GET.get('cart_id')
    action = request.GET.get('action')
    cart_item = Cart.objects.get(id=cart_id)
    
    # Increment or Decrement the quantity
    if action == 'increase':
        cart_item.quantity += 1
    elif action == 'decrease' and cart_item.quantity > 1:
        cart_item.quantity -= 1

    cart_item.save()
    
    # Recalculate total price for the cart item
    updated_total_price = cart_item.total_price
    
    # Return the updated total price
    return JsonResponse({'updated_total_price': updated_total_price})


# Delete Cart Item function (AJAX request)
def deleteCartItem(request):
    cart_id = request.GET.get('cart_id')
    cart_item = Cart.objects.get(id=cart_id)
    cart_item.delete()  # Delete the cart item
    return JsonResponse({'success': True})

@login_required
def checkout(request):
    user = request.user
    try:
        profile = Profile.objects.get(user=user)
    except Profile.DoesNotExist:
        profile = Profile(user=user)
    
    cart_data = Cart.objects.filter(user=user)
    
    cart_items = []
    for item in cart_data:
        cart_items.append({
            'pname': item.product.pname,
            'quantity': item.quantity,
            'price': item.quantity * (item.product.discounted_price or 0)
        })
    
    subtotal = sum(item.quantity * item.product.discounted_price for item in cart_data)
    shipping = 50  # Fixed shipping cost
    total = subtotal + shipping
    razorpay_amount = int(total * 100)  # Convert to paise
    
    if request.method == 'POST':
        # Collect any additional form data if needed
        address_line1 = request.POST.get('address_line1', profile.address_line1)
        address_line2 = request.POST.get('address_line2', profile.address_line2)
        city = request.POST.get('city', profile.city)
        state = request.POST.get('state', profile.state)
        zip_code = request.POST.get('zip_code', profile.zip_code)

        # Create an order
        new_order = OrderPlaced(
                user=user,
                profile=profile,
                total_price=total,
                status="Pending",  # Explicitly set status
            )
        new_order.save()
        
        # Generate order ID
        current_date = datetime.now().strftime("%Y%m%d")
        new_order.orderId = f"{current_date}{new_order.id}"
        new_order.save()
        
        # Add cart items to the order
        for cart_item in cart_data:
            OrderItem.objects.create(
                order=new_order,
                product=cart_item.product,
                quantity=cart_item.quantity,
                price=cart_item.total_price,
            )

        # Clear the cart
        # Cart.objects.filter(user=user).delete()
        
        # Authorize Razorpay client with API keys
        razorpay_client = razorpay.Client(auth=(settings.RAZORPAY_KEY_ID, settings.RAZORPAY_SECRET_KEY))
        currency = 'INR'
        
        # Create Razorpay Order
        razorpay_order = razorpay_client.order.create(
            dict(
                amount=razorpay_amount, 
                currency=currency, 
                payment_capture='1',
                notes={
                    'email': user.email,
                    'orderId': new_order.orderId,
                }
            )
        )
        
        # Order ID of the newly created order
        razorpay_order_id = razorpay_order['id']
        
        # Prepare context for Razorpay payment
        context = {
            'user': user,
            'profile': profile,
            'subtotal': subtotal,
            'total': total,
            'razorpay_order_id': razorpay_order_id,
            'razorpay_key': settings.RAZORPAY_KEY_ID,
            'razorpay_amount': razorpay_amount,
            'currency': currency,
            'email': user.email,
            'domain': request.get_host(),
            'new_order': new_order,
        }
        return render(request, 'checkout.html',context)

    # Default rendering if no POST request
    return render(request, 'checkout.html', locals())




@login_required
def paymentsuccess(request):
    order_id = request.GET.get('order_id')
    payment_id = request.GET.get('payment_id')
    total_bill = request.GET.get('total_bill')
    total_bill = float(total_bill)  # Convert to float first
    sub_total = int(total_bill) - 50  # Cast to int and subtract
    razorpay_client = razorpay.Client(auth=(settings.RAZORPAY_KEY_ID, settings.RAZORPAY_SECRET_KEY))

    try:
        order = OrderPlaced.objects.get(orderId=order_id, user=request.user)

        # Verify payment with Razorpay
        payment = razorpay_client.payment.fetch(payment_id)
        if payment and payment['status'] == 'captured':
            order.payment_id = payment_id
            order.status = "Paid"
            order.save()

            # Optionally clear the user's cart
            Cart.objects.filter(user=request.user).delete()
            
            #confirmation email to user 
            subject = f"Order - {order.orderId} - Payment Successful"
            order_items = OrderItem.objects.filter(order=order)
            context = {
                'order': order,
                'order_items': order_items,
                'subtotal': sub_total,
                'total_bill': total_bill
            }
            
            #render email content from template
            html_message = render_to_string('emails/order_confirmation.html', context)
            plain_message = strip_tags(html_message)

            #using mailgrid to send email notification
            send_mail(
                subject,
                plain_message,
                settings.DEFAULT_FROM_EMAIL,
                [request.user.email],
                html_message=html_message,
            )
            
            
            # Set toast message in the session
            request.session['toast_message'] = (
                "Payment successful! Details have been sent to your registered email address."
            )
            
            # Redirect to the cart page
            return redirect('show_cart')
        else:
            request.session['toast_message'] = "Payment verification failed."
            return redirect('show_cart')
        
    except OrderPlaced.DoesNotExist:
        request.session['toast_message'] = "Order not found."
        return redirect('show_cart')