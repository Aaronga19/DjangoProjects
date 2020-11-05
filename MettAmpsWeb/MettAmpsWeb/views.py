# Esto es un archivo dedicado a la vista 

from django.http import HttpResponse
from django.template import Template, Context
import datetime
from django.template.loader import get_template
from django.shortcuts import render

class Persona(object):
    def __init__(self, nombre, apellido):
        
        self.nombre = nombre
        
        self.apellido = apellido

def saludo(request): # Primera vista
    p1 = Persona("Aaronga", "Niza")
    temasdelCurso = ["Plantillas","Modelos","Formularios","Vistas","Despliege"]
    #nombre= "Aarón"
    #apellido = "Juarez"
    ahora = datetime.datetime.now()
    
    #docExterno = get_template('miPlantilla.html')
    #docExterno = open("C:/Users/Aaronga/Documents/GitHub/DjangoProjects/MettAmpsWeb/MettAmpsWeb/Plantillas/miPlantilla.html")
    #plt = Template(docExterno.read())
    #docExterno.close()
    """ctx = Context({"nombre_persona":p1.nombre,
                    "apellido_persona":p1.apellido,
                    "momento_actual":ahora,
                    "temas":temasdelCurso})"""
    dicc = {"nombre_persona":p1.nombre,
                    "apellido_persona":p1.apellido,
                    "momento_actual":ahora,
                    "temas":temasdelCurso}
    #documento = docExterno.render(dicc)
    return render(request, "miPlantilla.html", dicc)

def despedida(request): # Segunda vista
    return HttpResponse("Hasta luego alumnos de Django")

def DameFecha(request):
    
    fechaActual = datetime.datetime.now()
    
    #fecha = """<html>
    #<body
    #><h2>
    #Fecha y hora: {} 
    #</h2>
    #</body>
    #</html>""".format(fechaActual)

    fecha = f"""<html>
    <body
    ><h2>
    Fecha y hora: {fechaActual} 
    </h2>
    </body>
    </html>"""

    return HttpResponse(fecha)

def CalculaEdad(request,agno,edad):
    #edadActual=24
    periodo = agno-2020
    edadFutura = edad + periodo
    documento = f"<html><body><h2>En el año {agno} tendrás {edadFutura} años"

    return HttpResponse(documento)

def cursoC(request):
    fechaActual = datetime.datetime.now()
    return  render(request, "CursoC.html", {"DameFecha":fechaActual})
def guitars(request):
    fechaActual = datetime.datetime.now()
    return  render(request, "Guitars.html", {"DameFecha":fechaActual})