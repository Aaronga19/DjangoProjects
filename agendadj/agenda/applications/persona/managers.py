from django.db import models
#
from django.db.models import Count


class ReunionManager(models.Manager):

    def Cantidad_reuniones_job(self):
        resultado = self.values('persona__job').annotate(
            cantidad=Count('id')
        )
        
        return resultado