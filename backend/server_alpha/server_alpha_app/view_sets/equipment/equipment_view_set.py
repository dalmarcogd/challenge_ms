from server_alpha_app import view_sets, models, serializers


class EquipmentViewSet(view_sets.BaseViewSet):
    """
        View set represent the endpoint for EquipmentModel
    """
    serializer_class = serializers.EquipmentSerializer
    queryset = models.EquipmentModel.objects.all()
