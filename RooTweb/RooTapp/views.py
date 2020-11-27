from django.shortcuts import render, HttpResponse

# Create your views here.

def home(request):

    return render(request, 'RooTapp/home.html')

def shop(request):

    return render(request, 'RooTapp/shop.html')

def blog(request):

    return render(request, 'RooTapp/blog.html')

def contact(request):

    return render(request, 'RooTapp/contact.html')

# Para que se pueda visualizar, se tiene que registrar la app en settings.py