from server_beta_app import view_sets, models, serializers


class CustomerViewSet(view_sets.BaseDocumentViewSet):
    """
        View set represent the endpoint for CustomerModel
    """
    serializer_class = serializers.CustomerSerializer
    queryset = models.CustomerDocument.objects.all()
