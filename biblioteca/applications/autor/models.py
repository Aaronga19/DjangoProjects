from django.db import models

# Create your models here.
# Managers
from .managers import AutorManager


class Autor(models.Model):
    nombre = models.CharField("Nombre",
    max_length=50
    )
    apellido = models.CharField( 
    max_length=50
    )
    nacionalidad = models.CharField( 
    max_length=30
    )
    edad = models.PositiveIntegerField()

    objects = AutorManager()
    def __str__(self):
        return f"{self.nombre} - {self.apellido}" 