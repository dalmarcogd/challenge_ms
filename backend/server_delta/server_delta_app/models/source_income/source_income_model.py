from django.db import models
from server_delta_app import models as server_delta_app_models, managers


class SourceIncomeModel(server_delta_app_models.BaseModel):
    """
        Model that represent the customer debt registered in app
    """
    class Meta:
        db_table = "source_income"

    value = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.CharField(max_length=1000)
    customer_dossier = models.ForeignKey(server_delta_app_models.CustomerDossierModel, on_delete=models.CASCADE, related_name='sources_income')

    objects = managers.SourceIncomeManager()
