from django.contrib import admin
from .models import *

@admin.register(ResetPass)
class ResetPassAdmin(admin.ModelAdmin):
    list_display = ('user', 'forget_pass_token', 'created_at')
    search_fields = ('user__username', 'forget_pass_token')
    list_filter = ('created_at',)
    readonly_fields = ('created_at',)