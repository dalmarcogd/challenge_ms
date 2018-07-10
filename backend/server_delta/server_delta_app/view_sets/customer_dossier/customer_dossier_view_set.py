from server_delta_app import view_sets, models, serializers, services
from rest_framework import viewsets as viewsets_rest_framework, mixins
from rest_framework.permissions import AllowAny
from server_delta_app import services

from django.http import HttpResponse


class CustomerDossierViewSet(view_sets.BaseViewSet):
    """
        View set represent the endpoint for CustomerModel
    """
    serializer_class = serializers.CustomerDossierSerializer
    queryset = models.CustomerDossierModel.objects.all()
    required_scopes = ['read']

    def list(self, request, *args, **kwargs):
        response = super(CustomerDossierViewSet, self).list(request, args, kwargs)
        if request.GET.get('cpf', None) is None or len(response.data) > 0:
            return response
        cpf = request.GET.get('cpf', None)
        services.CustomerConsumerService().proccess_in_background(cpf)
        return response


class PublicCustomerDossierViewSet(viewsets_rest_framework.GenericViewSet,  mixins.CreateModelMixin):
    """
        Public View set represent the endpoint for CustomerDossierModel
    """
    serializer_class = serializers.CustomerDossierSerializer
    queryset = models.CustomerDossierModel.objects.all()
    permission_classes = (AllowAny,)

    def create(self, request, *args, **kwargs):
        print('Proccess in background...')
        services.CustomerConsumerService().proccess_in_background(request.data['cpf'])
        return HttpResponse('')
    