from django.contrib import admin
from blog import models

# Register your models here.
class categoriaAdmin(admin.ModelAdmin):
    readonly_fields = ("creado","modificado")


admin.site.register(models.Categoria, categoriaAdmin)

class blogAdmin(admin.ModelAdmin):
    readonly_fields = ("creado","modificado")


admin.site.register(models.Post, blogAdmin)

