from django.db import transaction

from server_beta_app import models, serializers


class UserSerializer(serializers.BaseModelSerializer):
    """
        Serializer responsible for serializer User
    """
    class Meta:
        model = models.UserModel
        fields = '__all__'
        validators = []

    @transaction.atomic()
    def create(self, validated_data):
        return models.UserModel.objects.create(**validated_data)

    @transaction.atomic()
    def update(self, instance, validated_data):
        return super().update(instance, validated_data)
