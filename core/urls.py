from django.urls import path
from .views import *


urlpatterns = [
    path('home/', home, name='home'),
    path('shop/', shop, name='shop'),
    path('pdetail/', p_detail, name='pdetail'),
    path('contact/', contact, name='contact'),
    path('search-suggestions/', search_suggestions, name='search-suggestions'),
    path('cart/', cartlist, name='cartlist'),
    path('checkout/', checkout, name='checkout'),
]