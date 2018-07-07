from rest_framework import exceptions
from rest_framework.exceptions import APIException


class BaseException(exceptions.APIException):
    status_code = None
    errors = None
    message = None
    detail = None
    is_an_error_response = True

    def __init__(self, error=None, errors=None):
        APIException.__init__(self)
        self.detail = self.message
        self.errors = errors if errors is not None else ([error] if error is not None else [])

    def to_dict(self):
        return {
            'type': self.get_type(),
            'message': self.message,
            'errors': self.errors
        }

    def get_type(self):
        return 'base'
