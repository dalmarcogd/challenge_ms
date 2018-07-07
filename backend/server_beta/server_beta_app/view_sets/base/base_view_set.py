from django.db.models import QuerySet
from oauth2_provider.views.generic import ProtectedResourceView
from oauth2_provider.contrib import rest_framework
from rest_framework import permissions, authentication, viewsets, exceptions, status
from rest_framework_mongoengine import viewsets as viewsets_mongoengine
import rest_condition
from server_beta_app.exceptions import InvalidFilterSearchException


class BaseModelViewSet(viewsets.ModelViewSet,  ProtectedResourceView):
    authentication_classes = [rest_framework.OAuth2Authentication, authentication.SessionAuthentication]
    permission_classes = [rest_condition.Or(rest_framework.IsAuthenticatedOrTokenHasScope)]
    required_scopes = ['read', 'write']
    
    def get_search_fields(self):
        """
        Return the fields that maybe be used to filter
        """
        assert self.search_fields is not None, (
                "'%s' should either include a `search_fields` attribute, "
                "or override the `get_search_fields()` method."
                % self.__class__.__name__
        )

        return self.search_fields

    def get_queryset(self):
        if self.action == 'list':
            filters = {}
            orders = []
            fields = []
            page_size = 10
            for key in self.request.GET:
                if key != 'page' and key != 'orders' and key != 'search' and key != 'fields' and key != 'page_size':
                    if self.request.GET.get(key) == '_None':
                        if str(key).endswith('!'):
                            filters['{0}__{1}'.format(str(key[:-1]), 'isnull')] = False
                        else:
                            filters['{0}__{1}'.format(str(key), 'isnull')] = True
                    else:
                        filters[str(key)] = self.request.GET.get(key)
                elif key == 'orders':
                    orders = self.request.GET.get(key).split(',')
                elif key == 'search':
                    search_fields = self.get_search_fields()
                    lookup_prefixes = {
                        '^': 'istartswith',
                        '=': 'iexact',
                        '@': 'search',
                        '$': 'iregex',
                    }
                    for search_field in search_fields:
                        filter = lookup_prefixes.get(search_field[:1])
                        if filter:
                            filters['{0}__{1}'.format(str(filter), filter)] = self.request.GET.get(key)
                        else:
                            raise InvalidFilterSearchException([search_field[:1]])
                elif key == 'page_size':
                    page_size = int(self.request.GET.get(key))
                elif key == 'fields':
                    fields = self.request.GET.get(key).split(',')
            results = []
            if len(orders) > 0:
                query_set = self.queryset.filter(**filters).order_by(*orders)[:page_size]
            elif self.action == 'retrieve':
                queryset = self.queryset
                if isinstance(queryset, QuerySet):
                    # Ensure queryset is re-evaluated on each request.
                    queryset = queryset.all()
                return queryset
            else:
                query_set = self.queryset.filter(**filters)[:page_size]

            if len(fields) > 0:
                results_dict = query_set.values(*fields)
                for result_dict in results_dict:
                    model_new = self.get_serializer().Meta.model()
                    for key in result_dict:
                        if '__' in key:
                            obj_keys = key.split('__')
                            if len(obj_keys) > 1:
                                model_old = model_new
                                model_current = model_new
                                for obj_key in obj_keys:
                                    model_field = model_current._meta.get_field(obj_key)
                                    if hasattr(model_field, 'related_model') and model_field.related_model is not None:
                                        if hasattr(model_current, obj_key):
                                            model_current = getattr(model_current, obj_key)
                                        else:
                                            model_current = model_field.related_model()
                                        setattr(model_old, obj_key, model_current)
                                        model_old = model_current
                                    else:
                                        setattr(model_current, obj_key, result_dict[key])
                            else:
                                setattr(model_new, key, result_dict[key])
                        else:
                            model_field = model_new._meta.get_field(key)
                            if hasattr(model_field, 'related_model') and model_field.related_model is not None:
                                if hasattr(model_new, key):
                                    model_current = getattr(model_new, key)
                                else:
                                    model_current = model_field.related_model()
                                setattr(model_new, key, model_current)
                                setattr(model_current, 'id', result_dict[key])
                            else:
                                setattr(model_new, key, result_dict[key])
                    results.append(model_new)
            else:
                results = query_set

            return results
        else:
            return super(BaseModelViewSet, self).get_queryset()


class PublicModelBaseViewSet(BaseModelViewSet):
    authentication_classes = [rest_framework.OAuth2Authentication, authentication.SessionAuthentication]
    permission_classes = [rest_condition.Or(rest_framework.IsAuthenticatedOrTokenHasScope)]
    required_scopes = [ 'read', 'write']


class BaseDocumentViewSet(viewsets_mongoengine.ModelViewSet,  ProtectedResourceView):
    authentication_classes = [rest_framework.OAuth2Authentication, authentication.SessionAuthentication]
    permission_classes = [rest_condition.Or(rest_framework.IsAuthenticatedOrTokenHasScope)]
    required_scopes = ['read', 'write']
    
    def get_search_fields(self):
        """
        Return the fields that maybe be used to filter
        """
        assert self.search_fields is not None, (
                "'%s' should either include a `search_fields` attribute, "
                "or override the `get_search_fields()` method."
                % self.__class__.__name__
        )

        return self.search_fields

    def get_queryset(self):
        if self.action == 'list':
            filters = {}
            orders = []
            fields = []
            page_size = 10
            for key in self.request.GET:
                if key != 'page' and key != 'orders' and key != 'search' and key != 'fields' and key != 'page_size':
                    if self.request.GET.get(key) == '_None':
                        if str(key).endswith('!'):
                            filters['{0}__{1}'.format(str(key[:-1]), 'isnull')] = False
                        else:
                            filters['{0}__{1}'.format(str(key), 'isnull')] = True
                    else:
                        filters[str(key)] = self.request.GET.get(key)
                elif key == 'orders':
                    orders = self.request.GET.get(key).split(',')
                elif key == 'search':
                    search_fields = self.get_search_fields()
                    lookup_prefixes = {
                        '^': 'istartswith',
                        '=': 'iexact',
                        '@': 'search',
                        '$': 'iregex',
                    }
                    for search_field in search_fields:
                        filter = lookup_prefixes.get(search_field[:1])
                        if filter:
                            filters['{0}__{1}'.format(str(filter), filter)] = self.request.GET.get(key)
                        else:
                            raise InvalidFilterSearchException([search_field[:1]])
                elif key == 'page_size':
                    page_size = int(self.request.GET.get(key))
                elif key == 'fields':
                    fields = self.request.GET.get(key).split(',')
            results = []
            if len(orders) > 0:
                query_set = self.queryset.filter(**filters).order_by(*orders)[:page_size]
            elif self.action == 'retrieve':
                queryset = self.queryset
                if isinstance(queryset, QuerySet):
                    # Ensure queryset is re-evaluated on each request.
                    queryset = queryset.all()
                return queryset
            else:
                query_set = self.queryset.filter(**filters)[:page_size]

            if len(fields) > 0:
                results_dict = query_set.values(*fields)
                for result_dict in results_dict:
                    model_new = self.get_serializer().Meta.model()
                    for key in result_dict:
                        if '__' in key:
                            obj_keys = key.split('__')
                            if len(obj_keys) > 1:
                                model_old = model_new
                                model_current = model_new
                                for obj_key in obj_keys:
                                    model_field = model_current._meta.get_field(obj_key)
                                    if hasattr(model_field, 'related_model') and model_field.related_model is not None:
                                        if hasattr(model_current, obj_key):
                                            model_current = getattr(model_current, obj_key)
                                        else:
                                            model_current = model_field.related_model()
                                        setattr(model_old, obj_key, model_current)
                                        model_old = model_current
                                    else:
                                        setattr(model_current, obj_key, result_dict[key])
                            else:
                                setattr(model_new, key, result_dict[key])
                        else:
                            model_field = model_new._meta.get_field(key)
                            if hasattr(model_field, 'related_model') and model_field.related_model is not None:
                                if hasattr(model_new, key):
                                    model_current = getattr(model_new, key)
                                else:
                                    model_current = model_field.related_model()
                                setattr(model_new, key, model_current)
                                setattr(model_current, 'id', result_dict[key])
                            else:
                                setattr(model_new, key, result_dict[key])
                    results.append(model_new)
            else:
                results = query_set

            return results
        else:
            return super(BaseModelViewSet, self).get_queryset()