from django.db import models
from server_delta_app import models as server_delta_app_models, managers


class CustomerDossierModel(server_delta_app_models.BaseModel):
    """
        Model that represent the customer registered in app
    """
    class Meta:
        db_table = "customer_dossier"
        indexes = [
            models.Index(fields=['cpf'], name='cpf_idx'),
        ]

    cpf = models.CharField(max_length=11, unique=True)
    name = models.CharField(max_length=100)
    date_birth = models.DateField(null=True)
    address = models.CharField(max_length=150)

    objects = managers.CustomerDossierManager()
    
