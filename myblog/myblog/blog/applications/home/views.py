import datetime
#
from django.shortcuts import render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse

from django.views.generic import (
    TemplateView,
    CreateView
)

# apps entrada
from applications.entrada.models import Entry
# models 
from .models import Home 
# forms
from .forms import SubscribersForm, ContactForm
class HomePageView(TemplateView):
    template_name = "home/index.html"

    def get_context_data(self, **kwargs):
        context = super(HomePageView,self).get_context_data(**kwargs)
        # Cargamos el home 
        context["home"] = Home.objects.latest('created')
        # Contexto de portada
        context["portada"] = Entry.objects.entrada_en_portada()
        # Contexto para los articulos en Home
        context["entradas_home"] = Entry.objects.entradas_en_home()
        # Contexto para los articulos recientes
        context["entradas_recientes"] = Entry.objects.entradas_recientes()
        # Enviamos formulario de suscripción
        context["form"]= SubscribersForm

        return context


class SubscriberCreateView(CreateView):
    form_class = SubscribersForm
    success_url = '.'

class ContactCreateView(CreateView):
    form_class = ContactForm
    success_url = '.'

