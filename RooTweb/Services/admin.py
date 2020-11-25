from django.contrib import admin
from Services import models

# Register your models here.

class ServicioAdmin(admin.ModelAdmin):
    readonly_fields = ("creado","modificado")


admin.site.register(models.Servicio, ServicioAdmin)
