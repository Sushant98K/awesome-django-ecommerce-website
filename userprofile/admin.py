from django.contrib import admin
from .models import *

@admin.register(Profile)
class ProfileModelAdmin(admin.ModelAdmin):
    list_display = ('user', 'phone', 'updated_at')
