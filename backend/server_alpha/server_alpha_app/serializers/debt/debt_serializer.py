from server_alpha_app import models, serializers


class DebtSerializer(serializers.BaseSerializer):
    """
        Serializer responsible by parse Debt
    """
    class Meta:
        model = models.DebtModel
        fields = '__all__'
