from server_alpha_app import models as server_alpha_app_models, managers
from django.contrib.auth import models as models_auth
from django.db import models


class UserModel(models_auth.AbstractUser, server_alpha_app_models.BaseModel):
    """
        Model that represent de user of application
    """
    class Meta:
        db_table = "user"

    name = models.CharField(max_length=100)
    objects = managers.UserManager()
