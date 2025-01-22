from django.db import models
from django.contrib.auth.models import User
from django.utils.timezone import now
from datetime import timedelta


class ResetPass(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    forget_pass_token = models.CharField(max_length=255, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"{self.user.username}"
