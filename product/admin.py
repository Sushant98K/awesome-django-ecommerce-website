from django.contrib import admin
from .models import *


@admin.register(Category)
class CategoryModelAdmin(admin.ModelAdmin):
    list_display = ('name', 'id', 'shortform')


@admin.register(Product)
class ProductModelAdmin(admin.ModelAdmin):
    list_display = ('id', 'pname', 'category', 'discounted_price', 'product_img')