from django.contrib import admin
from server_delta_app import models 


# Register your models here.

admin.site.register(models.UserModel)
admin.site.register(models.CustomerDossierModel)
admin.site.register(models.DebtModel)
admin.site.register(models.FinancialTransactionModel)
admin.site.register(models.SourceIncomeModel)
admin.site.register(models.PatrimonyModel)