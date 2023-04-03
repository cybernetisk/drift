import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

if 'DJANGO_SECRET_KEY' not in os.environ:
    raise Exception('Missing DJANGO_SECRET_KEY environment variable')
SECRET_KEY = os.environ['DJANGO_SECRET_KEY']

# see https://docs.djangoproject.com/en/1.7/ref/settings/#std:setting-DEBUG
DEBUG = 'DJANGO_DEBUG' in os.environ

ENABLE_SAML = True
SAML_FOLDER = os.path.join(BASE_DIR, 'samlauth', 'prod')

# see https://docs.djangoproject.com/en/1.7/ref/settings/#std:setting-ALLOWED_HOSTS
#ALLOWED_HOSTS = [
#    'something',
#]

# if collectstatic is used, set up this
STATIC_ROOT = "/usr/src/static/"


CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.db.DatabaseCache',
        'LOCATION': 'calender_cache',
    }
}
# example for postgres configuration
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ['POSTGRES_NAME'],
        'USER': 'internsystem',
        'PASSWORD': os.environ['POSTGRES_PASSWORD'],
        'HOST': 'cyb-internsystem-db',
        'PORT': '5432',
    }
}

# to log the queries in console, uncomment this
#LOGGING = {
#    'version': 1,
#    'handlers': {
#        'console': {
#            'level': 'DEBUG',
#            'class': 'logging.StreamHandler'
#        }
#    },
#    'loggers': {
#        'cyb_oko.querydebug': {
#            'handlers': ['console'],
#            'level': 'DEBUG'
#        },
#        'django.db.backends': {
#            'level': 'DEBUG',
#            'handlers': ['console']
#        }
#    }
#}
