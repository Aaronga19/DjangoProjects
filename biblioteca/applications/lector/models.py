from django.db import models
from applications.libro.models import Libro
from django.db.models.signals import post_delete


# From managers
from .managers import PrestamoManager
from applications.autor.models import Persona
from .signals import update_libro_stok
# Create your models here.

class Lector(Persona):
    
    class Meta:
        verbose_name = 'Lector'
        verbose_name_plural = 'Lectores'


    

class Prestamo(models.Model):
    lector = models.ForeignKey(
        Lector,
        on_delete=models.CASCADE
    )
    libro = models.ForeignKey(
        Libro,
        on_delete=models.CASCADE,
        related_name='libro_prestamo'
        )
    fecha_prestamo = models.DateField()
    fecha_devolucion  = models.DateField(
        blank=True, 
        null=True
    )
    devuelto = models.BooleanField()

    objects = PrestamoManager()

    def save(self,*args,**kwards):

        self.libro.stok -= 1
        self.libro.save()

        super(Prestamo,self).save(*args,**kwards)  

    def __str__(self):
        return f"**{self.libro.titulo}**"

post_delete.connect(update_libro_stok,sender=Prestamo)

