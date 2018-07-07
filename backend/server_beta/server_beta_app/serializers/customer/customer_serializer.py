from server_beta_app import models, serializers


class CustomerSerializer(serializers.BaseDocumentSerializer):
    """
        Serializer responsible by parse customer
    """
    class Meta:
        model = models.CustomerDocument
        fields = '__all__'
