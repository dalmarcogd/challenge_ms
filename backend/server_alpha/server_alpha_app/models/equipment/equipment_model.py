from django.db import models
from server_alpha_app import models as server_alpha_app, managers


class EquipmentModel(server_alpha_app.BaseModel):
    """
        Model that represent the equipments registered in app
    """
    class Meta:
        db_table = "equipment"
    name = models.CharField(max_length=100)

    objects = managers.EquipmentManager()
