from django.contrib import admin
from server_alpha_app import models 


# Register your models here.

admin.site.register(models.UserModel)
admin.site.register(models.CustomerModel)
admin.site.register(models.DebtModel)