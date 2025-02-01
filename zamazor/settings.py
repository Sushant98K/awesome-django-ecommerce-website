"""
Django settings for zamazor project.

Generated by 'django-admin startproject' using Django 5.1.4.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.1/ref/settings/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Session expires after 10 minutes of inactivity
SESSION_COOKIE_AGE = 300  
SESSION_SAVE_EVERY_REQUEST = True

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.getenv('SECRET_KEY')

from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()
dotenv_path = os.path.join(os.path.dirname(__file__), 'secret.env')
load_dotenv(dotenv_path)

# for this to work properly in cmd "set RAZORPAY_KEY_ID/RAZORPAY_SECRET_KEY=your_actual_key"

# RAZORPAY_KEY_ID = os.environ.get('RAZORPAY_KEY_ID')
# RAZORPAY_SECRET_KEY = os.environ.get('RAZORPAY_SECRET_KEY')

RAZORPAY_KEY_ID = os.getenv('RAZORPAY_KEY_ID')
RAZORPAY_SECRET_KEY = os.getenv('RAZORPAY_SECRET_KEY')

# Email settings
# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_HOST = 'smtp.sendgrid.net'
# EMAIL_PORT = 587
# EMAIL_USE_TLS = True
# EMAIL_HOST_USER = 'apikey'
# # EMAIL_HOST_PASSWORD =  os.environ.get('SENDGRID_API_KEY')
# EMAIL_HOST_PASSWORD = os.getenv('SENDGRID_API_KEY')
# DEFAULT_FROM_EMAIL = 'zamazor.ecom@gmail.com'


# Email Settings for Mailgun
MAILGUN_API_URL = "https://api.mailgun.net/v3/" + os.getenv("MAILGUN_DOMAIN", "")
MAILGUN_API_KEY = os.getenv("MAILGUN_API_KEY")
MAILGUN_FROM_EMAIL = f"Zamazor <mailgun@{os.getenv('MAILGUN_DOMAIN', '')}>"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = os.getenv('DEBUG')

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]

EXTERNAL_APPS = [
    'core',
    'product',
    'userauth',
    'userprofile',
    'shopcart',
    'custadmin',
]

INSTALLED_APPS += EXTERNAL_APPS

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'zamazor.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / "core/templates"],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'shopcart.context_processors.cart_item_count',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'zamazor.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.1/ref/settings/#databases


# MY-SQL Server
DATABASES = {
    'default': {
        "ENGINE": 'django.db.backends.mysql',
        "NAME": "zamazor",
        "USER": "root",
        "PASSWORD": "1234",
        "HOST": "127.0.0.1",
        "PORT": "3306",
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.1/howto/static-files/

STATIC_URL = 'static/'

#lgoin decoretor
LOGIN_URL = '/user/login/'

#media Files
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Default primary key field type
# https://docs.djangoproject.com/en/5.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
