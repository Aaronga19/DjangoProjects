import datetime
from django.db import models
from django.db.models import Q, Count
# Importar trigram
from django.contrib.postgres.search import TrigramSimilarity

class LibroManager(models.Manager):
    """ Managers para el modelo autor """

    def listar_libros(self, kword):

        resultado = self.filter(
            titulo__icontains=kword,
            fecha__range=('1990-01-01','2000-01-01')
            )
        return self.all()

    def listar_libros2(self, kword, fecha1, fecha2):
        date1 = datetime.datetime.strptime(fecha1, "%Y-%m-%d").date()
        date2 = datetime.datetime.strptime(fecha2, "%Y-%m-%d").date()
        resultado = self.filter(
            titulo__icontains=kword,
            fecha__range=(date1,date2)
            )
        return resultado 

    def listar_libros_trg(self, kword):

        if kword:
            resultado = self.filter(
                titulo__trigram_similar=kword,
                )
            return resultado
        else:
            return self.all()[:10]

    def listar_libros_categoria(self, categoria):
        return self.filter(
            categoria__nombre=categoria
            ).order_by("titulo")
    
    def add_autor_libro(self, libro_id, autor):
        libro = self.get(id=libro_id)
        libro.autores.add(autor)
        return libro
    
    def remove_autor_libro(self, libro_id, autor):
        libro = self.get(id=libro_id)
        libro.autores.remove(autor)
        return libro

    def libros_num_prestamos(self):
        resultado = self.aggregate(
            num_prestamos=Count('libro_prestamo')
        )
        return resultado
        
class CategoriaManager(models.Manager):
    """ Managers para el modelo autor """

    def categoria_por_autor(self, autor):
        return self.filter(
            categoria_libro__autores__id=autor
        ).distinct()

    def listar_categoria_libros(self):
        resultado = self.annotate(
            num_libros = Count('categoria_libro')
        )
        for r in resultado:
            print(f"""
            ******
                {r} | {r.num_libros}""")
        return resultado
   