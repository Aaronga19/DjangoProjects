from django.db import models

# Create your models here.

class Clientes(models.Model):
    nombre = models.CharField(max_length=30)
    #apellidos = models.CharField(max_length=30)
    dirección = models.CharField(max_length=50,verbose_name="Su dirección")
    email = models.EmailField(max_length=25,blank=True,null=True)
    telefono = models.CharField(max_length=10)

    def __str__(self):
        return f"{self.nombre}"

class Articulos(models.Model):
    nombre = models.CharField(max_length=30)
    seccion = models.CharField(max_length=20)
    precio = models.IntegerField()

    def __str__(self):
        return f'El nombre es --{self.nombre}-- la sección es --{self.seccion}-- y el precio es --{self.precio}--\n'

class Pedidos(models.Model):
    numero = models.IntegerField()
    fecha = models.DateField()
    entregado = models.BooleanField()


