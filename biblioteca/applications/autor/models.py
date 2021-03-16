from django.db import models

# Create your models here.
# Managers
from .managers import AutorManager

class Persona(models.Model):
    nombres = models.CharField("Nombre",
    max_length=50
    )
    apellidos = models.CharField( 
    max_length=50
    )
    nacionalidad = models.CharField( 
    max_length=20
    )
    edad = models.PositiveIntegerField(default=0)

    class Meta:
        abstract = True

    def __str__(self):
        return f"{self.id} | {self.nombres} - {self.apellidos }" 

class Autor(Persona):
    seudonimo = models.CharField(
        'Seudonimo', 
        max_length=50,
        blank=True,
    )
    objects = AutorManager()
    