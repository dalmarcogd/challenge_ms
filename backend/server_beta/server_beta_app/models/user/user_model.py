from server_beta_app import models as server_beta_app_models, managers
from django.contrib.auth import models as models_auth


class UserModel(models_auth.AbstractUser, server_beta_app_models.BaseModel):
    """
        Model that represent de user of application
    """
    class Meta:
        db_table = "user"

    objects = managers.UserManager()
