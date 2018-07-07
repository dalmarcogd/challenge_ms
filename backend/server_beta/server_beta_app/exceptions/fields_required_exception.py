from .base_exception import BaseException


class FieldsRequiredException(BaseException):
    status_code = 400

    def get_type(self):
        return 'fields_required'
