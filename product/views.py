from django.shortcuts import render, get_object_or_404
from .models import *

# Create your views here.

def categoryView(request, val):
    category = get_object_or_404(Category, shortform=val)
    products = Product.objects.filter(category = category)
    category_name = category.name if category else 'Unknown Category'
    return render(request, 'categoryShop.html', locals())

def productDetail(request, pk):
    
    product = get_object_or_404(Product, pk=pk)
    category_name = product.category.name if product.category else 'Unknown Category'
    return render(request, 'productDetail.html', locals())

