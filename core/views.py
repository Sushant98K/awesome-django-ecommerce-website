from django.shortcuts import render
from django.core.paginator import Paginator
from django.http import JsonResponse
from product.models import *

# Create your views here.
def home(request):
    welcome_message = request.session.pop('welcome_message', '')
    toast_message = request.session.pop('toast_message', '')
    return render(request, 'index.html', {'welcome_message': welcome_message,'title': 'Home', 'toast_message': toast_message})
    # return render(request, 'index.html', {'title': 'Home'})

# def shop(request):
#     products = Product.objects.all().order_by('?')  # Fetch all products from the database
#     paginator = Paginator(products, 9)  # Show 9 products per page
#     page_number = request.GET.get('page')  # Get the current page number from the query parameters
#     page_obj = paginator.get_page(page_number)  # Get products for the current page

#     context = {
#         'title': 'Shop',
#         'page_obj': page_obj,  # Pass the paginated products
#     }
#     return render(request, 'shop.html', context)


def shop(request):
    query = request.GET.get('search', '').strip()  # Get the search term from query params
    
    if query:
        # Filter products by the search query
        products = Product.objects.filter(pname__icontains=query).order_by('?')
    else:
        # Fetch all products if no search query is provided
        products = Product.objects.all().order_by('?')
    
    paginator = Paginator(products, 9)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'title': 'Shop',
        'page_obj': page_obj,
    }
    return render(request, 'shop.html', context)


def search_suggestions(request):
    query = request.GET.get('query', '').strip()
    suggestions = []
    
    if query:
        products = Product.objects.filter(pname__icontains=query).order_by('pname')[:5]
        suggestions = [{'id': p.id, 'pname': p.pname, 'discounted_price': p.discounted_price, 'product_img': p.product_img.url} for p in products]
    
    return JsonResponse({'suggestions': suggestions})

def p_detail(request):
    return render(request, 'p_detail.html', {'title': 'detail'})

def contact(request):
    return render(request, 'contact.html', {'title': 'contact'})

def cartlist(request):
    return render(request, 'cart.html', {'title': 'cart'})

def checkout(request):
    return render(request, 'checkout.html', {'title': 'checkout'})