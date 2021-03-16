from django.shortcuts import render
from django.views.generic.edit import FormView
import datetime
# Create your views here.
from .forms import PrestamoForm
from .models import Prestamo

class RegistrarPrestamo(FormView):
    template_name='lector/add_prestamo.html'
    form_class = PrestamoForm 
    success_url = '.' # Para que vuelva a cargar la misma página

    def form_valid(self,form):
        Prestamo.objects.create(
            lector=form.cleaned_data['lector'],
            libro=form.cleaned_data['libro'],
            fecha_prestamo=datetime.date.today(),
            devuelto=False,

        )
        # Segundo metodo
        '''prestamo = Prestamo(
            lector=form.cleaned_data['lector'],
            libro=form.cleaned_data['libro'],
            fecha_prestamo=datetime.date.today(),
            devuelto=False,
        )'''

        prestamo.save()
        return super(RegistrarPrestamo,self).form_valid(form)

