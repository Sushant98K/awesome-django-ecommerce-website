from django.contrib.auth.models import User
from django.db import models

class Profile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    # Personal Information
    first_name = models.CharField(max_length=100, blank=True)
    last_name = models.CharField(max_length=100, blank=True)
    
    # Contact Details
    phone = models.CharField(max_length=15, blank=True)
    address_line1 = models.CharField(max_length=255, blank=True)
    address_line2 = models.CharField(max_length=255, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=100, blank=True)
    country = models.CharField(max_length=100, default="India")
    zip_code = models.CharField(max_length=20, blank=True)
    
    # E-commerce Specific
    date_of_birth = models.DateField(null=True, blank=True)
    shipping_address = models.TextField(blank=True)
    billing_address = models.TextField(blank=True)
    # profile_image = models.ImageField(upload_to="profile_images/", default="default_profile.jpg", blank=True)

    # Additional Fields
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.user.username