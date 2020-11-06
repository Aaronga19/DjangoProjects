from django.contrib import admin
from gestionPedidos.models import *

# Register your models here.

class ClientesAdmin(admin.ModelAdmin):
    list_display=("nombre", "dirección", "telefono")
    search_fields= ("nombre","telefono") 


class ArticulosAdmin(admin.ModelAdmin):
    list_display=("nombre","seccion","precio")
    search_fields= ("nombre","seccion") 
    list_filter= ("seccion",)

class FechaAdmin(admin.ModelAdmin):
    list_display=("numero", "fecha", "entregado")
    list_filter=("fecha",)
    date_hierarchy="fecha"


admin.site.register(Clientes, ClientesAdmin)
admin.site.register(Articulos, ArticulosAdmin)
admin.site.register(Pedidos, FechaAdmin)

