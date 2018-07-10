from server_delta_app import models, serializers


class SourceIncomeSerializer(serializers.BaseSerializer):
    """
        Serializer responsible by parse SourceIncome
    """
    class Meta:
        model = models.SourceIncomeModel
        fields = '__all__'
        extra_kwargs = {
            'id': {'read_only': False, 'required': False},
        }
