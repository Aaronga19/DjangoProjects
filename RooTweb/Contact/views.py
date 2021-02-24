from django.shortcuts import render, redirect
from .forms import ContactForm
from django.core.mail import EmailMessage
# Create your views here.


def contact(request):
    formulario_contacto = ContactForm()
    if request.method == "POST":
        formulario_contacto=ContactForm(data=request.POST)
        if formulario_contacto.is_valid():
            nombre=request.POST.get("nombre")
            email=request.POST.get("email")
            contenido = request.POST.get("contenido")

            email=EmailMessage("Mensaje desde Django", f"El usuario con nombre '{nombre}' con la dirección '{email}' escribe lo siguiente:\n\n '{contenido}'", "",
             ["arcanmett@gmail.com"], reply_to=[email])

            try:
                email.send()
                return redirect("/Contact/?valido")
            except: 
                return redirect("/Contact/?novalido")

            
    return render(request, 'Contact/contact.html', {'miFormulario': formulario_contacto})