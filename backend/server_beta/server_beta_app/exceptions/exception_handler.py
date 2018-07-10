from rest_framework import views
from rest_framework.exceptions import ValidationError

from server_beta_app.exceptions import UniqueFieldException
from .base_exception import BaseException


def custom_exception_handler(exc, context):
    # Call REST framework's default exception handler first,
    # to get the standard error response.
    resp = views.exception_handler(exc, context)
    if isinstance(exc, BaseException) or isinstance(exc, UniqueFieldException):
        resp.data = exc.to_dict()
        resp.status_code = exc.status_code
    elif isinstance(exc, ValidationError):
        errors = []
        if isinstance(exc.detail, list):
            errors = exc.detail
        else:
            for key, value in exc.detail.items():
                if isinstance(value, list):
                    for v in value:
                        if v == 'A user with that username already exists.':
                            errors.append('Usuário já existente para este e-mail.')
                        elif v == 'This field is required.':
                            errors.append('Field \'{}\' is required.'.format(key))
                        else:
                            errors.append(v)
                else:
                    if value == 'user model with this username already exists.':
                        errors.append('Usuário já existente para este e-mail.')
                    elif value == 'This field is required.':
                        errors.append('Field \'{}\' is required.'.format(key))
                    else:
                        errors.append(value)
        resp.data =  {
            'type': exc.default_code,
            'message': 'Error',
            'errors': errors
        }

    return resp
