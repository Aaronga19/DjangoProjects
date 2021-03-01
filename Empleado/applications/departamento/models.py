from django.db import models

# Create your models here.


class Departamento(models.Model):
    name = models.CharField('Nombre', max_length=50, editable=False)
    shor_name = models.CharField('Nombre corto', max_length=20, unique=True)
    active = models.BooleanField('Activo', default=False)

    def __str__(self):
        return f"{self.name} - {self.shor_name} - {str(self.active)}"


