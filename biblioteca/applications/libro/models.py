from django.db import models

from django.db.models.signals import post_save 
# app terceros
from PIL import Image
from applications.autor.models import Autor
from .managers import LibroManager, CategoriaManager

# Create your models here.

class Categoria(models.Model):
    nombre = models.CharField(max_length=30)
    objects = CategoriaManager()
    def __str__(self):
        return self.nombre
    
class Libro(models.Model):
    categoria = models.ForeignKey(
        Categoria, 
        on_delete=models.CASCADE,
        related_name='categoria_libro'
        )
    autores = models.ManyToManyField(
        Autor
        )

    titulo = models.CharField(max_length=50)
    fecha = models.DateField('Fecha de lanzamiento')
    portada = models.ImageField(upload_to='portada', blank=True, null=True)
    visitas = models.PositiveIntegerField(blank=True, null=True)
    stok = models.PositiveIntegerField(default=0)
    objects = LibroManager()

    class Meta:
        verbose_name = 'Libro'
        verbose_name_plural = 'Libros'
        ordering = ['titulo', 'fecha']
        

    def __str__(self):
        return f"{self.id} | {self.titulo}"

def optimize_image(sender, instance, **kwargs):
    if instance.portada:
        portada = Image.open(instance.portada.path)
        portada.save(instance.portada.path, quality=20, optimize=True)

post_save.connect(optimize_image, sender=Libro)
