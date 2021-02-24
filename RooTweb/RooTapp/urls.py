from django.urls import path
from RooTapp import views




urlpatterns = [
    path('', views.home, name='Home'),
]

