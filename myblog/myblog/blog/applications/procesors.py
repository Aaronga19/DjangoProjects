from applications.home.models import Home

# Procesor para recuperar telefono e Email del registro home 
# AÑADIR ESTE PROCESO A ARCHIVO BASE EN TEMPLATE = ['context_processors']
def home_contact(request):
    home = Home.objects.latest('created')
    return {
        'phone' : home.phone,
        'email' : home.contact_email,
    }