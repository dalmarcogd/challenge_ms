from rest_framework.fields import ImageField
from django.core.exceptions import ValidationError
from .base64_mixin_field import Base64FieldMixin
from .image_base64_field import Base64ImageField


class HybridImageField(Base64ImageField):
    """
    A django-rest-framework field for handling image-uploads through
    raw post data, with a fallback to multipart form data.
    """

    def to_internal_value(self, data):
        """
        Try Base64Field first, and then try the ImageField
        ``to_internal_value``, MRO doesn't work here because
        Base64FieldMixin throws before ImageField can run.
        """
        try:
            return Base64FieldMixin.to_internal_value(self, data)
        except ValidationError:
            return ImageField.to_internal_value(self, data)
