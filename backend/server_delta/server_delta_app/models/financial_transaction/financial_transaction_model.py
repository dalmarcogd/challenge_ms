from django.db import models
from server_delta_app import models as server_delta_app_models, managers


class FinancialTransactionModel(server_delta_app_models.BaseModel):
    """
        Model that represent the customer debt registered in app
    """
    class Meta:
        db_table = "financial_transaction"

    value = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.CharField(max_length=1000)
    date = models.DateField()
    type_transaction = models.CharField(max_length=100)
    payment_type = models.CharField(max_length=100)
    customer_dossier = models.ForeignKey(server_delta_app_models.CustomerDossierModel, on_delete=models.CASCADE, related_name='financial_transactions')

    objects = managers.FinancialTransactionManager()
