from server_beta_app import models, serializers


class SourceIncomeSerializer(serializers.BaseDocumentSerializer):
    """
        Serializer responsible by parse SourceIncome
    """
    class Meta:
        model = models.SourceIncomeDocument
        fields = '__all__'
