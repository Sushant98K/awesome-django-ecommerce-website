from django.contrib.auth.decorators import login_required
from django.urls import path
from .views import *

urlpatterns = [
    path('dashboard/', dashboard, name='dashboard'),
    
    path('', auth_signin, name='auth-signin'),
    
    path('auth-logout/', auth_logout, name='auth_logout'),
    
    path('apps-calendar/', login_required(apps_calendar), name='apps-calendar'),

    path('apps-chat/', login_required(apps_chat), name='apps-chat'),

    path('apps-email/', login_required(apps_email), name='apps-email'),

    path('apps-todo/', login_required(apps_todo), name='apps-todo'),

    path('auth-lock-screen/', auth_lock_screen, name='auth-lock-screen'),

    path('auth-password/', auth_password, name='auth-password'),

    path('auth-signup/', auth_signup, name='auth-signup'),

    path('category-add/', category_add, name='category-add'),
    
    path('category-delete/<int:category_id>/', category_delete, name='category-delete'),

    path('category-edit/<int:category_id>', category_edit, name='category-edit'),

    path('category-list/', category_list, name='category-list'),

    path('coupons-add/', login_required(coupons_add), name='coupons-add'),

    path('coupons-list/', login_required(coupons_list), name='coupons-list'),

    path('customer-detail/', login_required(customer_detail), name='customer-detail'),

    path('customer-list/', login_required(customer_list), name='customer-list'),

    path('inventory-received-orders/', login_required(inventory_received_orders), name='inventory-received-orders'),

    path('inventory-warehouse/', login_required(inventory_warehouse), name='inventory-warehouse'),

    path('invoice-add/', login_required(invoice_add), name='invoice-add'),

    path('invoice-details/', login_required(invoice_details), name='invoice-details'),

    path('invoice-list/', login_required(invoice_list), name='invoice-list'),

    path('order-cart/', login_required(order_cart), name='order-cart'),

    path('order-checkout/', login_required(order_checkout), name='order-checkout'),

    path('order-detail/', login_required(order_detail), name='order-detail'),

    path('orders-list/', login_required(orders_list), name='orders-list'),

    path('pages-404/', login_required(pages_404), name='pages-404'),

    path('pages-comingsoon/', login_required(pages_comingsoon), name='pages-comingsoon'),

    path('pages-maintenance/', login_required(pages_maintenance), name='pages-maintenance'),

    path('pages-profile/', login_required(pages_profile), name='pages-profile'),

    path('pages-review/', login_required(pages_review), name='pages-review'),

    path('product-add/', login_required(product_add), name='product-add'),

    path('product-details/', login_required(product_details), name='product-details'),

    path('product-edit/', login_required(product_edit), name='product-edit'),

    path('product-list/', login_required(product_list), name='product-list'),

    path('purchase-list/', login_required(purchase_list), name='purchase-list'),

    path('purchase-order/', login_required(purchase_order), name='purchase-order'),

    path('purchase-returns/', login_required(purchase_returns), name='purchase-returns'),

    path('seller-add/', login_required(seller_add), name='seller-add'),

    path('seller-details/', login_required(seller_details), name='seller-details'),

    path('seller-edit/', login_required(seller_edit), name='seller-edit'),

    path('seller-list/', login_required(seller_list), name='seller-list'),

    path('settings/', login_required(settings), name='settings'),

]
