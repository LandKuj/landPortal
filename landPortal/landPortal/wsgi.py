"""
WSGI config for landPortal project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/howto/deployment/wsgi/
"""

import os, sys
#sys.path.append('/usr/local/django')
#os.environ['DJANGO_SETTINGS_MODULE'] = landPortal.settings


from django.core.wsgi import get_wsgi_application
#from django.core.handlers.wsgi

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "landPortal.settings")


application = get_wsgi_application()
#application = django.core.handlers.wsgi.WSGIHandler()

