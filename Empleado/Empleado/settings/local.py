from .base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

#PostgreSQL
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'dbempleado',
        'USER' : 'postgres',
        'PASSWORD':'Colesman1<',
        'HOST':'localhost',
        'PORT':'5432',
    }
}
#SQL SERVER



# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = [BASE_DIR.child('static')]

# Configuración para generar los archivos de media de los registros
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR.child('media')
