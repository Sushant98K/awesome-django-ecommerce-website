# from django.urls import path
# from .views import *


# urlpatterns = [
#     path('add-to-cart/', addToCart, name='add_to_cart'),
#     path('cart/', showCart, name='show_cart'),
    
# ]

from django.urls import path
from .views import *

urlpatterns = [
    path('add-to-cart/', addToCart, name='add_to_cart'), # URL for add-to-cart
    path('cart/', showCart, name='show_cart'), # URL for show cart
    path('update-cart-quantity/', updateCartQuantity, name='update_cart_quantity'),  # URL for updating quantity
    path('delete_cart_item/', deleteCartItem, name='delete_cart_item'), # URL for deleting cart item
    path('cart_summary/', cartSummary, name='cart_summary'), # URL for cart summary
    path('checkout/', checkout, name='checkout'), # URL for checkout
    path('paymentsuccess/', paymentsuccess, name='paymentsuccess'),
]
