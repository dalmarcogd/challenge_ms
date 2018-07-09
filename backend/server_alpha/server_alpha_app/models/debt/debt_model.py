from django.db import models
from server_alpha_app import models as server_alpha_app_models, managers


class DebtModel(server_alpha_app_models.BaseModel):
    """
        Model that represent the customer debt registered in app
    """
    class Meta:
        db_table = "debt"

    value = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()
    customer = models.ForeignKey(server_alpha_app_models.CustomerModel, on_delete=models.CASCADE, related_name='debts')

    objects = managers.DebtManager()
