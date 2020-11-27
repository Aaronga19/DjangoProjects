from django.shortcuts import render
from Services.models import Servicio

# Create your views here.



def services(request):

    servicios =  Servicio.objects.all()
    return render(request, 'Services/services.html', {"servicios": servicios})