from server_delta_app import models, serializers


class PatrimonySerializer(serializers.BaseSerializer):
    """
        Serializer responsible by parse Patrimony
    """
    class Meta:
        model = models.PatrimonyModel
        fields = '__all__'
        extra_kwargs = {
            'id': {'read_only': False, 'required': False},
        }
