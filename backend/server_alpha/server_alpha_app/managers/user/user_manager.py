import unicodedata

from django.contrib.auth import models as models_django
from django.db import transaction
from django.utils.encoding import force_text

from server_alpha_app import managers, models, exceptions


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

        # Proccess de type os user.
        gym_data = extra_fields.get('gym')
        teacher_data = extra_fields.get('teacher')
        student_data = extra_fields.get('student')
        user_google = extra_fields.get('user_google')
        picture_data = extra_fields.get('picture')

        gym = None
        teacher = None
        student = None
        picture = None

        from gym_app import serializers
        if gym_data is not None:
            gym = serializers.GymSerializer().create(gym_data)
        elif teacher_data is not None:
            teacher = serializers.TeacherSerializer().create(teacher_data)
        elif student_data is not None:
            student = serializers.StudentSerializer().create(student_data)

        if picture_data is not None:
            if picture_data is not None:
                picture = models.FileModel.objects.create(**picture_data)

        user = models.UserModel(name=name, username=username, email=email, gym=gym, teacher=teacher, student=student, user_google=user_google, picture=picture)
        user.set_password(password)
        user.save()
        return user

    @transaction.atomic()
    def create(self, name, email, password, username=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('gym', None)
        extra_fields.setdefault('teacher', None)
        extra_fields.setdefault('student', None)
        extra_fields.setdefault('user_google', None)
        extra_fields.setdefault('picture', None)
        return self._create_user(name, email, password, username, **extra_fields)

    @transaction.atomic()
    def create_by_user_google(self, user_google, **extra_fields):
        date_iso_str = user_google.registered.isoformat()
        date_str = date_iso_str[:10]
        time_str = date_iso_str[11:19]
        password = 'UserGoogle#{0} {1}#{2}'.format(date_str, time_str, user_google.email)
        extra_fields.setdefault('user_google', user_google)
        return self._create_user(user_google.name, user_google.email, password, None, **extra_fields)

    @transaction.atomic()
    def create_superuser(self, name, email, password, username=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('gym', None)
        extra_fields.setdefault('teacher', None)
        extra_fields.setdefault('student', None)
        extra_fields.setdefault('user_google', None)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(name, email, password, username, **extra_fields)

    @classmethod
    def normalize_username(cls, username):
        return unicodedata.normalize('NFKC', force_text(username))
