from django.shortcuts import render

def dashboard(request):
    title = 'Admin Panel | Dashboard Overview'
    herotag = 'Welcome!'
    return render(request, 'custadmin/dashboard.html', locals())

def apps_calendar(request):
    title = 'Admin Panel | Manage Calendar'
    herotag = 'Manage Your Schedule'
    return render(request, 'custadmin/apps-calendar.html', locals())

def apps_chat(request):
    title = 'Admin Panel | Team Chat'
    herotag = 'Team Communication'
    return render(request, 'custadmin/apps-chat.html', locals())

def apps_email(request):
    title = 'Admin Panel | Email Management'
    herotag = 'Email Management'
    return render(request, 'custadmin/apps-email.html', locals())

def apps_todo(request):
    title = 'Admin Panel | Manage To-Do List'
    herotag = 'Task Management'
    return render(request, 'custadmin/apps-todo.html', locals())

def auth_lock_screen(request):
    title = 'Admin Panel | Lock Screen'
    herotag = 'Secure Your Session'
    return render(request, 'custadmin/auth-lock-screen.html', locals())

def auth_password(request):
    title = 'Admin Panel | Reset Password'
    herotag = 'Change Your Password'
    return render(request, 'custadmin/auth-password.html', locals())

def auth_signin(request):
    title = 'Admin Panel | Sign In'
    herotag = 'Access Your Account'
    return render(request, 'custadmin/auth-signin.html', locals())

def auth_signup(request):
    title = 'Admin Panel | Register Account'
    herotag = 'Register New Account'
    return render(request, 'custadmin/auth-signup.html', locals())

def category_add(request):
    title = 'Admin Panel | Create Category'
    herotag = 'Create Category'
    return render(request, 'custadmin/category-add.html', locals())

def category_edit(request):
    title = 'Admin Panel | Edit Category'
    herotag = 'Update Category Information'
    return render(request, 'custadmin/category-edit.html', locals())

def category_list(request):
    title = 'Admin Panel | Category List'
    herotag = 'View All Categories'
    return render(request, 'custadmin/category-list.html', locals())

def coupons_add(request):
    title = 'Admin Panel | Create Coupon'
    herotag = 'Create New Coupon'
    return render(request, 'custadmin/coupons-add.html', locals())

def coupons_list(request):
    title = 'Admin Panel | Coupons List'
    herotag = 'View All Coupons'
    return render(request, 'custadmin/coupons-list.html', locals())

def customer_detail(request):
    title = 'Admin Panel | Customer Details'
    herotag = 'View Customer Details'
    return render(request, 'custadmin/customer-detail.html', locals())

def customer_list(request):
    title = 'Admin Panel | Customer List'
    herotag = 'View All Customers'
    return render(request, 'custadmin/customer-list.html', locals())

def inventory_received_orders(request):
    title = 'Admin Panel | Received Orders'
    herotag = 'Manage Received Orders'
    return render(request, 'custadmin/inventory-received-orders.html', locals())

def inventory_warehouse(request):
    title = 'Admin Panel | Warehouse Inventory'
    herotag = 'Manage Warehouse'
    return render(request, 'custadmin/inventory-warehouse.html', locals())

def invoice_add(request):
    title = 'Admin Panel | Create Invoice'
    herotag = 'Add New Invoice'
    return render(request, 'custadmin/invoice-add.html', locals())

def invoice_details(request):
    title = 'Admin Panel | Invoice Details'
    herotag = 'View Invoice Details'
    return render(request, 'custadmin/invoice-details.html', locals())

def invoice_list(request):
    title = 'Admin Panel | Invoice List'
    herotag = 'View All Invoices'
    return render(request, 'custadmin/invoice-list.html', locals())

def order_cart(request):
    title = 'Admin Panel | Order Cart'
    herotag = 'Manage Your Cart'
    return render(request, 'custadmin/order-cart.html', locals())

def order_checkout(request):
    title = 'Admin Panel | Order Checkout'
    herotag = 'Proceed with Checkout'
    return render(request, 'custadmin/order-checkout.html', locals())

def order_detail(request):
    title = 'Admin Panel | Order Details'
    herotag = 'View Order Information'
    return render(request, 'custadmin/order-detail.html', locals())

def orders_list(request):
    title = 'Admin Panel | Orders List'
    herotag = 'View All Orders'
    return render(request, 'custadmin/orders-list.html', locals())

def pages_404(request):
    title = 'Admin Panel | Page Not Found'
    herotag = 'Error 404'
    return render(request, 'custadmin/pages-404.html', locals())

def pages_comingsoon(request):
    title = 'Admin Panel | Coming Soon'
    herotag = 'Under Development'
    return render(request, 'custadmin/pages-comingsoon.html', locals())

def pages_maintenance(request):
    title = 'Admin Panel | Maintenance'
    herotag = 'Under Maintenance'
    return render(request, 'custadmin/pages-maintenance.html', locals())

def pages_profile(request):
    title = 'Admin Panel | Profile'
    herotag = 'View Your Profile'
    return render(request, 'custadmin/pages-profile.html', locals())

def pages_review(request):
    title = 'Admin Panel | Reviews'
    herotag = 'View Customer Reviews'
    return render(request, 'custadmin/pages-review.html', locals())

def product_add(request):
    title = 'Admin Panel | Add Product'
    herotag = 'Create New Product'
    return render(request, 'custadmin/product-add.html', locals())

def product_details(request):
    title = 'Admin Panel | Product Details'
    herotag = 'View Product Information'
    return render(request, 'custadmin/product-details.html', locals())

def product_edit(request):
    title = 'Admin Panel | Edit Product'
    herotag = 'Update Product Information'
    return render(request, 'custadmin/product-edit.html', locals())

def product_list(request):
    title = 'Admin Panel | Product List'
    herotag = 'View All Products'
    return render(request, 'custadmin/product-list.html', locals())

def purchase_list(request):
    title = 'Admin Panel | Purchase List'
    herotag = 'View All Purchases'
    return render(request, 'custadmin/purchase-list.html', locals())

def purchase_order(request):
    title = 'Admin Panel | Create Purchase Order'
    herotag = 'Add New Purchase Order'
    return render(request, 'custadmin/purchase-order.html', locals())

def purchase_returns(request):
    title = 'Admin Panel | Purchase Returns'
    herotag = 'Manage Returns'
    return render(request, 'custadmin/purchase-returns.html', locals())

def seller_add(request):
    title = 'Admin Panel | Add Seller'
    herotag = 'Create New Seller'
    return render(request, 'custadmin/seller-add.html', locals())

def seller_details(request):
    title = 'Admin Panel | Seller Details'
    herotag = 'View Seller Information'
    return render(request, 'custadmin/seller-details.html', locals())

def seller_edit(request):
    title = 'Admin Panel | Edit Seller'
    herotag = 'Update Seller Information'
    return render(request, 'custadmin/seller-edit.html', locals())

def seller_list(request):
    title = 'Admin Panel | Seller List'
    herotag = 'View All Sellers'
    return render(request, 'custadmin/seller-list.html', locals())

def settings(request):
    title = 'Admin Panel | Settings'
    herotag = 'Manage System Settings'
    return render(request, 'custadmin/settings.html', locals())
