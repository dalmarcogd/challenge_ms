from server_beta_app import models, serializers


class PatrimonySerializer(serializers.BaseDocumentSerializer):
    """
        Serializer responsible by parse Debt
    """
    class Meta:
        model = models.PatrimonyDocument
        fields = '__all__'
