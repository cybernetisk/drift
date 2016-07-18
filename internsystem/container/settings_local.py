import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

if 'DJANGO_SECRET_KEY' not in os.environ:
    raise Exception('Missing DJANGO_SECRET_KEY environment variable')
SECRET_KEY = os.environ['DJANGO_SECRET_KEY']

# see https://docs.djangoproject.com/en/1.7/ref/settings/#std:setting-DEBUG
DEBUG = 'DJANGO_DEBUG' in os.environ

# enable SAML if wanted
# see setup_saml.sh
ENABLE_SAML = 'DJANGO_ENABLE_SAML' in os.environ
#SAML_FOLDER = os.path.join(BASE_DIR, 'samlauth', 'prod')

# see https://docs.djangoproject.com/en/1.7/ref/settings/#std:setting-ALLOWED_HOSTS
#ALLOWED_HOSTS = [
#    'something',
#]

# if collectstatic is used, set up this
STATIC_ROOT = "/usr/src/static/"

# example for postgres configuration
#DATABASES = {
#    'default': {
#        'ENGINE': 'django.db.backends.postgresql_psycopg2',
#        'NAME': 'django',
#        'USER': 'django',
#        'PASSWORD': 'edit-me',
#        'HOST': '127.0.0.1',
#        'PORT': '5432',
#    }
#}

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
