from server_alpha_app import view_sets, models, serializers, managers
from rest_framework import mixins,status
from django.http import response
import json


class UserViewSet(view_sets.BaseViewSet):
    serializer_class = serializers.UserSerializer
    queryset = models.UserModel.objects.all()
    required_scopes = ['read', 'write']


class PublicUserViewSet(view_sets.PublicBaseViewSet, mixins.CreateModelMixin, mixins.ListModelMixin):
    serializer_class = serializers.UserSerializer
    queryset = models.UserModel.objects.all()
    required_scopes = ['read']



