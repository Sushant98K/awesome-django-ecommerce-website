from django.urls import path
from .views import *

urlpatterns = [
    path('dashboard/', dashboard, name='dashboard'),
    
    path('apps-calendar/', apps_calendar, name='apps-calendar'),

    path('apps-chat/', apps_chat, name='apps-chat'),

    path('apps-email/', apps_email, name='apps-email'),

    path('apps-todo/', apps_todo, name='apps-todo'),

    path('auth-lock-screen/', auth_lock_screen, name='auth-lock-screen'),

    path('auth-password/', auth_password, name='auth-password'),

    path('auth-signin/', auth_signin, name='auth-signin'),

    path('auth-signup/', auth_signup, name='auth-signup'),

    path('category-add/', category_add, name='category-add'),

    path('category-edit/', category_edit, name='category-edit'),

    path('category-list/', category_list, name='category-list'),

    path('coupons-add/', coupons_add, name='coupons-add'),

    path('coupons-list/', coupons_list, name='coupons-list'),

    path('customer-detail/', customer_detail, name='customer-detail'),

    path('customer-list/', customer_list, name='customer-list'),

    path('inventory-received-orders/', inventory_received_orders, name='inventory-received-orders'),

    path('inventory-warehouse/', inventory_warehouse, name='inventory-warehouse'),

    path('invoice-add/', invoice_add, name='invoice-add'),

    path('invoice-details/', invoice_details, name='invoice-details'),

    path('invoice-list/', invoice_list, name='invoice-list'),

    path('order-cart/', order_cart, name='order-cart'),

    path('order-checkout/', order_checkout, name='order-checkout'),

    path('order-detail/', order_detail, name='order-detail'),

    path('orders-list/', orders_list, name='orders-list'),

    path('pages-404/', pages_404, name='pages-404'),

    path('pages-comingsoon/', pages_comingsoon, name='pages-comingsoon'),

    path('pages-maintenance/', pages_maintenance, name='pages-maintenance'),

    path('pages-profile/', pages_profile, name='pages-profile'),

    path('pages-review/', pages_review, name='pages-review'),

    path('product-add/', product_add, name='product-add'),

    path('product-details/', product_details, name='product-details'),

    path('product-edit/', product_edit, name='product-edit'),

    path('product-list/', product_list, name='product-list'),

    path('purchase-list/', purchase_list, name='purchase-list'),

    path('purchase-order/', purchase_order, name='purchase-order'),

    path('purchase-returns/', purchase_returns, name='purchase-returns'),

    path('seller-add/', seller_add, name='seller-add'),

    path('seller-details/', seller_details, name='seller-details'),

    path('seller-edit/', seller_edit, name='seller-edit'),

    path('seller-list/', seller_list, name='seller-list'),

    path('settings/', settings, name='settings'),

]
