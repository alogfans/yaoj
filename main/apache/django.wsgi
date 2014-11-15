import os,sys
os.environ["PYTHON_EGG_CACHE"] = "/tmp"
sys.path.append('/home/yaoj/main')
os.environ['DJANGO_SETTINGS_MODULE'] = 'yaoj.settings'

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()



