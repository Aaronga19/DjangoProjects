from django.contrib import admin
from django.urls import path

def DesdeApps(self):
    print('=================DESDE LA APP DPP ===================')
urlpatterns = [
    path('departamento/', DesdeApps),
]
