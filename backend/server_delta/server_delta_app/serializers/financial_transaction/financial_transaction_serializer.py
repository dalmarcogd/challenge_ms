from server_delta_app import models, serializers


class FinancialTransactionSerializer(serializers.BaseSerializer):
    """
        Serializer responsible by parse FinancialTransaction
    """
    class Meta:
        model = models.FinancialTransactionModel
        fields = '__all__'
        extra_kwargs = {
            'id': {'read_only': False, 'required': False},
        }
