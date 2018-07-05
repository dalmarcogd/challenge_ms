import imghdr

from django.utils.translation import ugettext_lazy as _
from rest_framework.fields import FileField

from .base64_mixin_field import Base64FieldMixin


class Base64FileField(Base64FieldMixin, FileField):
    """
    A django-rest-framework field for handling file-uploads through raw post data.
    It uses base64 for en-/decoding the contents of the file.
    """
    ALLOWED_TYPES = (
        "jpeg",
        "jpg",
        "png",
        "gif",
        "txt",
        "csv"
    )
    INVALID_FILE_MESSAGE = _("Please upload a valid file.")
    INVALID_TYPE_MESSAGE = _("The type of the file couldn't be determined.")

    def get_file_extension(self, filename, decoded_file):
        return imghdr.what(filename, decoded_file)
