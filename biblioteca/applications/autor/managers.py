from django.db import models
from django.db.models import Q

class AutorManager(models.Manager):
    """ Managers para el modelo autor """

    def buscar_autor(self, kword):

        resultado = self.filter(
            nombre__icontains=kword
            )
        return resultado
    def buscar_autor2(self, kword):
        
        resultado = self.filter(
            Q(nombre__icontains=kword) | Q(apellido__icontains=kword)
            )
        return resultado

    def buscar_autor3(self,kword):
        resultado = self.filter(
            nombre__icontains=kword
            ).exclude(# Tambien puede ser con otro filter en vez de exclude
                Q(edad=48) | Q(edad=31))
        return resultado

    def buscar_autor4(self,kword):
        resultado = self.filter(
            edad__gt=40,
            edad__lt=65
        ).order_by('apellido', 'nombre', 'id')
        return resultado