from django.urls import path
from .views import *


urlpatterns = [
    path('category/<str:val>', categoryView, name='categoryShop'),
    path('product-detail/<int:pk>', productDetail, name='product-detail'),
]