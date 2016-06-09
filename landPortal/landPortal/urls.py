from django.conf.urls import url, include
from django.contrib import admin


urlpatterns = [

   # Admin and App URL
    url(r'^portal/', include('portal.urls')),
    url(r'^$', include('portal.urls')), 
    url(r'^admin/', admin.site.urls),

   # Auth URLs
   url(r'^login/$', 'django.contrib.auth.views.login'),
   url(r'^logout/$', 'django.contrib.auth.views.logout'), 




]
