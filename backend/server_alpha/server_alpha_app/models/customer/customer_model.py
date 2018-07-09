from django.db import models
from server_alpha_app import models as server_alpha_app_models, managers


class CustomerModel(server_alpha_app_models.BaseModel):
    """
        Model that represent the customer registered in app
    """
    class Meta:
        db_table = "customer"
        indexes = [
            models.Index(fields=['cpf'], name='cpf_idx'),
        ]

    cpf = models.CharField(max_length=11, unique=True)
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=150)
    

    objects = managers.CustomerManager()
    
