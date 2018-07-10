from django.db import models
from server_delta_app import models as server_delta_app_models, managers


class DebtModel(server_delta_app_models.BaseModel):
    """
        Model that represent the customer debt registered in app
    """
    class Meta:
        db_table = "debt"

    value = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()
    customer_dossier = models.ForeignKey(server_delta_app_models.CustomerDossierModel, on_delete=models.CASCADE, related_name='debts')

    objects = managers.DebtManager()
