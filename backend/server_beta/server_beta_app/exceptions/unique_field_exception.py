from .base_exception import BaseException
from rest_framework import exceptions


class UniqueFieldException(BaseException, exceptions.APIException):
    status_code = 400
    message = 'Unique field violated'

    def get_type(self):
        return 'unique_field'
