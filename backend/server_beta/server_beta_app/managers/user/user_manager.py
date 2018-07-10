import unicodedata

from django.contrib.auth import models as models_django
from django.db import transaction
from django.utils.encoding import force_text

from server_beta_app import managers, models, exceptions


class UserManager(managers.BaseManager, models_django.BaseUserManager):
    """
       Manager responsible for persist User
    """

    use_in_migrations = True

    def _validate_create(self, model):
        if models.UserModel.objects.filter(email=model.email).count():
            raise exceptions.UniqueFieldException(['Campo e-mail já utilizado.'])

    def _create_user(self, name, email, password, username=None, **extra_fields):
        """
        Creates and saves a User with the given username, email and password.
        """
        if not email:
            raise exceptions.FieldsRequiredException(['Campo "E-mail" é obrigatório.'])

        if username is None:
            username = email.split("@")[0]

        email = self.normalize_email(email)
        username = self.normalize_username(username)

        user = models.UserModel(name=name, username=username, email=email)
        user.set_password(password)
        user.save()
        return user

    @transaction.atomic()
    def create(self, name, email, password, username=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        extra_fields.setdefault('is_staff', False)
        return self._create_user(name, email, password, username, **extra_fields)

    @transaction.atomic()
    def create_superuser(self, name, email, password, username=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(name, email, password, username, **extra_fields)

    @classmethod
    def normalize_username(cls, username):
        return unicodedata.normalize('NFKC', force_text(username))
