from django.shortcuts import render
from django.views.generic import ListView, DetailView, CreateView, TemplateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import *

# Create your views here.
# Listar trabajadores de la empresa 
class ListAllEmpleados(ListView):
    model = Empleado
    template_name = "persona/list_all.html"
    context_object_name = "Empleados"
    paginate_by = 4
    fields = ["first_name", "last_name"]
    """def get_queryset(self):
        numero = self.request.GET.get("page", '')
        return numero"""
# Listar por area de la empresa
class ListByAreaEmpleado(ListView):
    """Lista empleados de un area"""
    template_name = "persona/list_all_by.html"
    def get_queryset(self):
        area = self.kwargs["shorname"]
        "el código que yo quiera"
        lista = Empleado.objects.filter(departamento__shor_name = area)
        return lista
# Listar Empleados por trabajo
"""class ListByJobEmpleado(ListView):
    '''Lista empleados de un area'''
    template_name = "persona/list_all_byJob.html"
    def get_queryset(self):
        area = self.kwargs["shorname"]
        "el código que yo quiera"
        lista = Empleado.objects.filter(departamento__shor_name = area)
        return lista
 """
class ListEmpleadosByKword(ListView):
    """    Lista empleado por palabra clave    """
    template_name = "persona/by_kword.html"
    context_object_name = 'empleados'
    def get_queryset(self):
        palabra_clave = self.request.GET.get("kword", '')
        lista = Empleado.objects.filter(
            first_name = palabra_clave
            )
        return lista


class ListaHabilidades(ListView):
    template_name = 'persona/habilidades.html'
    context_object_name = 'habilidades'
    def get_queryset(self):
        empleado = Empleado.objects.get(id=8)
        return empleado.habilidades.all()

# Conocer los detalles de un producto
class EmpleadoDetailView(DetailView):
    model = Empleado 
    template_name = "persona/detail_empleado.html"

# CREATE VIEW Vista para registrar empleados en la base de datos
    # 4 campos para funcionar

class SuccessView(TemplateView):
    template_name = "persona/success.html"


class EmpleadoCreateView(CreateView):
    template_name = "persona/add.html"
    model = Empleado
    fields = ["first_name", "last_name", "job", "departamento", "habilidades"]
    success_url = reverse_lazy('persona_app:correcto')
    def form_valid(self,form):
        # lógica del proceso
        empleado = form.save()
        empleado.full_name = empleado.first_name + ' ' + empleado.last_name
        empleado.save()
        return super(EmpleadoCreateView, self).form_valid(form)

# Para actualizar mis registros
class EmpleadoUpdateView(UpdateView):
    template_name = "persona/update.html"
    model = Empleado
    fields = ["first_name", "last_name", "job", "departamento", "habilidades"]
    success_url = reverse_lazy('persona_app:correcto')
    def post(self,request,*args,**kwargs):
        self.object = self.get_object()
        return super().post(request,*args, **kwargs)
        
    def form_valid(self, ):
        return super(EmpleadoUpdateView, self).form_valid(form)



class EmpleadoDeleteView(DeleteView):
    template_name = "persona/delete.html"
    model = Empleado
    success_url = reverse_lazy("persona_app:correcto")




