from .base_exception import BaseException
from rest_framework import exceptions


class InvalidTokenGoogledException(BaseException, exceptions.APIException):
    status_code = 400
    message = 'Invalid token google'

    def get_type(self):
        return 'invalid_token_google'
