from rest_framework import serializers
from server_alpha_app import models


class BaseSerializer(serializers.ModelSerializer):
    """
        Base Serializer that keep base implementation for serializers
    """

    def update(self, instance, validated_data):
        return self.Meta.model.objects.update(instance, validated_data)
