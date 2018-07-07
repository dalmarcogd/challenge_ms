from rest_framework import serializers
from server_beta_app import models
from rest_framework_mongoengine import serializers as serializers_mongoengine


class BaseModelSerializer(serializers.ModelSerializer):
    """
        Base Model Serializer that keep base implementation for serializers of model
    """

    def update(self, instance, validated_data):
        return self.Meta.model.objects.update(instance, validated_data)

class BaseDocumentSerializer(serializers_mongoengine.DocumentSerializer):
    """
        Base Document Serializer that keep base implementation for serializers of document
    """
    pass
