from server_alpha_app import view_sets, models, serializers


class CustomerViewSet(view_sets.BaseViewSet):
    """
        View set represent the endpoint for CustomerModel
    """
    serializer_class = serializers.CustomerSerializer
    queryset = models.CustomerModel.objects.all()
