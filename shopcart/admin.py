from django.contrib import admin
from .models import *


class OrderPlacedAdmin(admin.ModelAdmin):
    list_display = ('orderId', 'user', 'total_price', 'status', 'order_date', 'profile')
    search_fields = ('orderId', 'user__username', 'profile__first_name', 'profile__last_name')
    list_filter = ('status', 'order_date')

class OrderItemAdmin(admin.ModelAdmin):
    list_display = ('order', 'product', 'quantity', 'price')
    search_fields = ('order__orderId', 'product__pname')
    list_filter = ('order__status',)

admin.site.register(OrderPlaced, OrderPlacedAdmin)
admin.site.register(OrderItem, OrderItemAdmin)
