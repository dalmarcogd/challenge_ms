"""server_beta_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url, include
import oauth2_provider.views as oauth2_views
from server_beta_project import settings
from rest_framework import routers
from server_beta_app import view_sets
from rest_framework_swagger.views import get_swagger_view
from rest_framework.schemas import get_schema_view


oauth2_endpoint_views = [
    url(r'^authorize/$', oauth2_views.AuthorizationView.as_view(), name="authorize"),
    url(r'^token/$', oauth2_views.TokenView.as_view(), name="token"),
    url(r'^revoke-token/$', oauth2_views.RevokeTokenView.as_view(), name="revoke-token"),
    url(r"^introspect/$", oauth2_views.IntrospectTokenView.as_view(), name="introspect"),
    url(r"^check/$", view_sets.CheckTokenViewSet.as_view(), name="check-token"),
]

if settings.DEBUG:
    # OAuth2 Application Management endpoints
    oauth2_endpoint_views += [
        url(r'^applications/$', oauth2_views.ApplicationList.as_view(), name="list"),
        url(r'^applications/register/$', oauth2_views.ApplicationRegistration.as_view(), name="register"),
        url(r'^applications/(?P<pk>\d+)/$', oauth2_views.ApplicationDetail.as_view(), name="detail"),
        url(r'^applications/(?P<pk>\d+)/delete/$', oauth2_views.ApplicationDelete.as_view(), name="delete"),
        url(r'^applications/(?P<pk>\d+)/update/$', oauth2_views.ApplicationUpdate.as_view(), name="update"),
    ]

    # OAuth2 Token Management endpoints
    oauth2_endpoint_views += [
        url(r'^authorized-tokens/$', oauth2_views.AuthorizedTokensListView.as_view(), name="authorized-token-list"),
        url(r'^authorized-tokens/(?P<pk>\d+)/delete/$', oauth2_views.AuthorizedTokenDeleteView.as_view(), name="authorized-token-delete"),
    ]

api_router = routers.DefaultRouter()
api_router.register(r'users', view_sets.UserViewSet)
api_router.register(r'customers', view_sets.CustomerViewSet, base_name='customers')

api_public_router = routers.DefaultRouter()
api_public_router.register(r'users', view_sets.PublicUserViewSet)

app_name = 'server_beta_app'

# swagger_view = get_swagger_view(title=settings.API_NAME)
#
# schema_view = get_schema_view(title=settings.API_NAME)

urlpatterns = [
    # url(r'^swagger/$', swagger_view, name='swagger-root'),

    url(r'^admin/', admin.site.urls),
    url(r'^api/', include(api_router.urls)),
    url(r'^api/oauth/', include(oauth2_endpoint_views)),
    url(r'^api/public/', include(api_public_router.urls)),
]
