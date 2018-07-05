from server_alpha_app import models, serializers


class EquipmentSerializer(serializers.BaseSerializer):
    """
        Serializer responsible for serializer Equipment
    """
    class Meta:
        model = models.EquipmentModel
        fields = '__all__'
