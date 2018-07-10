from django.db import models
from server_delta_app import models as server_delta_app_models, managers


class PatrimonyModel(server_delta_app_models.BaseModel):
    """
        Model that represent the customer debt registered in app
    """
    class Meta:
        db_table = "patrimony"

    value = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.CharField(max_length=1000)
    customer_dossier = models.ForeignKey(server_delta_app_models.CustomerDossierModel, on_delete=models.CASCADE, related_name='patrimonies')

    objects = managers.PatrimonyManager()
