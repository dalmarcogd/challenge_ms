from .base_exception import BaseException
from rest_framework import exceptions


class InvalidFilterSearchException(BaseException, exceptions.APIException):
    status_code = 400
    message = 'Invalid filter search'

    def get_type(self):
        return 'invalid_filter_search'
