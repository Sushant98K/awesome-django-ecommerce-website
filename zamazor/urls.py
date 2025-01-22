from django.conf import settings                #to access settings
from django.conf.urls.static import static      #to access static folder to upload all images that we recive

from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('core/', include('core.urls')),
    path('product/', include('product.urls')),
    path('user/', include('userauth.urls')),
    path('userprofile/', include('userprofile.urls')),
    path('shopcart/', include('shopcart.urls')),
    path('custadmin/', include('custadmin.urls')),
    
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
