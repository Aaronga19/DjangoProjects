from rest_framework.generics import ListAPIView
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated, IsAdminUser


from django.shortcuts import render
from .models import Product
from .serializers import ProductSerializer
# Create your views here.


class ListProductUser(ListAPIView):
    serializer_class=ProductSerializer
    authentication_classes= (TokenAuthentication,)
    permission_classes = [IsAuthenticated, IsAdminUser]

    def get_queryset(self):
        # recuperando usuario
        
        return Product.objects.producto_con_stok()


class ListProductGenero(ListAPIView):
    serializer_class=ProductSerializer

    def get_queryset(self):
        genero = self.kwargs['gender']
        # recuperando usuario
        
        return Product.objects.producto_por_genero(genero)


class FiltrarProductos(ListAPIView):
    """ """
    serializer_class = ProductSerializer

    def get_queryset(self):
        varon = self.request.query_params.get('man', None)
        mujer = self.request.query_params.get('woman', None)
        nombre = self.request.query_params.get('name', None)
        #
        return Product.objects.filtrar_prodctos(
            man=varon,
            woman=mujer,
            name=nombre
        )