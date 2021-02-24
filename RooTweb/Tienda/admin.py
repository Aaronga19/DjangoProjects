from django.contrib import admin
from .models import *
# Register your models here.

class CatergoriaProdAdmin(admin.ModelAdmin):
    readonly_fields=("created", "updated")
class ProductoAdmin(admin.ModelAdmin):
    readonly_fields=("created", "updated")

admin.site.register(CatergoriaProd, CatergoriaProdAdmin)

admin.site.register(Producto,ProductoAdmin)
