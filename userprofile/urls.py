from django.urls import path
from .views import *


urlpatterns = [
    path('user/', profileDetails, name='user'),
    path('edituser/', editProfile, name='edituser'),
]