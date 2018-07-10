from django.db import models


class BaseModel(models.Model):
    """
        Model base for another models in app
    """

    class Meta:
        abstract = True

    objects = None





