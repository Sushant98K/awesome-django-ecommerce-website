from django.contrib.auth.models import User
from django.db import models
from product.models import Product
from userprofile.models import *
from product.models import *


class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    added_at = models.DateTimeField(auto_now_add=True)
    
    @property
    def total_price(self):
        if not self.product.discounted_price:
            return 0
        return self.quantity * self.product.discounted_price
    
    def __str__(self):
        return f"Cart({self.user.username}, {self.product.pname}, Quantity: {self.quantity})"

    class Meta:
        unique_together = ('user', 'product')


class OrderPlaced(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)
    orderId = models.CharField(max_length=50, default="", blank=True)
    quantity = models.PositiveIntegerField(default=1)
    order_date = models.DateTimeField(auto_now_add=True)
    total_price = models.DecimalField(max_digits=10, decimal_places=2)
    payment_id = models.CharField(max_length=100, blank=True, null=True)
    status = models.CharField(max_length=20, default='Pending')  # 'Pending' or 'Paid'
    @property
    def total_cost(self):
        return self.quantity * self.product.discounted_price

class OrderItem(models.Model):
    order = models.ForeignKey(OrderPlaced, on_delete=models.CASCADE, related_name='items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"{self.order.orderId} - {self.product.pname}"