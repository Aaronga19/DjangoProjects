from django.shortcuts import render, HttpResponse

# Create your views here.

def home(request):

    return render(request, 'RooTapp/home.html')




# Para que se pueda visualizar, se tiene que registrar la app en settings.py