from server_alpha_app import models, serializers


class CustomerSerializer(serializers.BaseSerializer):
    """
        Serializer responsible by parse customer
    """
    class Meta:
        model = models.CustomerModel
        fields = '__all__'
