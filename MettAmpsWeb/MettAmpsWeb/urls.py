"""MettAmpsWeb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from MettAmpsWeb.views import * #Se importan todos los metodos del archivo views
urlpatterns = [
    path('admin/', admin.site.urls),
    path("saludo/", saludo),
    path("adios/", despedida),
    path("fecha/", DameFecha),
    path("edades/<int:edad>/<int:agno>", CalculaEdad),
    path("cursoC/", cursoC),
    path("newGuitars", guitars)

]
