import base64
import binascii
import uuid

from django.core.exceptions import ValidationError
from django.core.files.base import ContentFile
from django.utils import six
from django.utils.translation import ugettext_lazy as _
from django.core.files.storage import default_storage


class Base64FieldMixin(object):
    ALLOWED_TYPES = NotImplemented
    INVALID_FILE_MESSAGE = NotImplemented
    INVALID_TYPE_MESSAGE = NotImplemented
    EMPTY_VALUES = (None, '', [], (), {})

    def __init__(self, *args, **kwargs):
        self.represent_in_base64 = kwargs.pop('represent_in_base64', False)
        print(args)
        print(kwargs)
        super(Base64FieldMixin, self).__init__(*args, **kwargs)

    def to_internal_value(self, base64_data):
        # Check if this is a base64 string
        if base64_data in self.EMPTY_VALUES:
            return None

        if isinstance(base64_data, six.string_types):
            # Strip base64 header.
            if ';base64,' in base64_data:
                header, base64_data = base64_data.split(';base64,')
            # Try to decode the file. Return validation error if it fails.
            try:
                decoded_file = base64.b64decode(base64_data)
            except (TypeError, binascii.Error, ValueError):
                raise ValidationError(self.INVALID_FILE_MESSAGE)
            # Generate file name:
            # 12 characters are more than enough.
            file_name = str(uuid.uuid4())[:12]
            # Get the file name extension:
            file_extension = self.get_file_extension(file_name, decoded_file)
            if file_extension not in self.ALLOWED_TYPES:
                raise ValidationError(self.INVALID_TYPE_MESSAGE)
            complete_file_name = file_name + "." + file_extension
            data = ContentFile(decoded_file, name=complete_file_name)
            return super(Base64FieldMixin, self).to_internal_value(data)
        raise ValidationError(_('This is not an base64 string'))

    def get_file_extension(self, filename, decoded_file):
        raise NotImplemented

    def to_representation(self, file):
        if self.represent_in_base64:
            try:
                return base64.b64encode(file.read()).decode()
            except Exception as e:
                print(file)
                print('Fails to decode file: %s (%s)' % (e, type(e)))
                return ''
        else:
            return super(Base64FieldMixin, self).to_representation(file)
