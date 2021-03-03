from django.db import models
from applications.departamento.models import Departamento
from ckeditor.fields import RichTextField
# Create your models here.

class Habilidades(models.Model):
    habilidad = models.CharField('Habilidad', max_length=50)

    class meta:
        verbose_name = 'Habilidad'
        verbose_name_plural = 'Habilidades'
        
    def __str__(self):
        return self.habilidad


class Empleado(models.Model):
    """ Modelo de tabla para empleados """
    # Contador
    # Administrador
    # Economista 
    # Otro
    jobs = (("0","Contador"), ("1", "Administrador"), ("3", "Economista"), ("4","Otro"),("5", 'Ingeniería'))
    
    first_name = models.CharField("Nombre", max_length=50)
    last_name = models.CharField("Apelldio", max_length=50)
    full_name = models.CharField(
        "Nombre completo", 
        max_length=120, 
        blank=True)
    job = models.CharField("Trabajo", max_length=50, choices=jobs, )
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    avatar = models.ImageField('Foto', upload_to="Empleado", null=True, blank=True)
    habilidades = models.ManyToManyField(Habilidades)
    hoja_vida = RichTextField()


    def __str__(self):
        return f"{self.first_name} - {self.last_name}"