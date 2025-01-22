from django.urls import path
from .views import *


urlpatterns = [
    path('login/', userlogin, name = 'login'),
    path('register/', userregister, name = 'register'),
    path('resetpass/', resetpass, name='resetpass'),
    path('passreset/<str:token>/', passreset, name='passreset'),
    # path('send-confirm/',send_confirm, name='send-confirm'),
    path('logout/', userLogout, name='logout'),
]