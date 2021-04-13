from rest_framework.generics import ListAPIView
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated


from django.shortcuts import render
from .models import Product
from .serializers import ProductSerializer
# Create your views here.


class ListProductUser(ListAPIView):
    serializer_class=ProductSerializer
    authentication_classes= (TokenAuthentication,)
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        # recuperando usuario
        print('************')
        user= self.request.user
        return Product.objects.producto_por_usuario()
