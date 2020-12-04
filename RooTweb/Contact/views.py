from django.shortcuts import render
from .forms import *

# Create your views here.


def contact(request):
    contact_form = ContactForm()
    return render(request, 'Contact/contact.html', {'miFormulario': contact_form})