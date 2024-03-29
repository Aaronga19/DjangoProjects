#
from django.utils import timezone
from django.shortcuts import render
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.generics import ListAPIView, CreateAPIView
from rest_framework.response import Response

#
from applications.producto.models import Product

from .models import Sale, SaleDetail
from .serializers import (
    ventaReporteSerializers,
    ProcesoVentaSerializer,
    ProcesoVentaSerializer2
)
# Create your views here.

class ReporteVentasList(ListAPIView):
    serializer_class=ventaReporteSerializers
    
    def get_queryset(self):
        return Sale.objects.all()

class RegistrarVenta2(CreateAPIView):
    """  """
    authentication_classes= (TokenAuthentication,)
    permission_classes = [IsAuthenticated]
    serializer_class = ProcesoVentaSerializer2

    def create(self, request, *args, **kwargs):
        serializer = ProcesoVentaSerializer2(data=request.data)
        #
        serializer.is_valid(raise_exception=True)
        #
        venta= Sale.objects.create(
            date_sale=timezone.now(),
            amount=0,
            count=0,
            type_invoce=serializer.validated_data['type_invoce'],
            type_payment=serializer.validated_data['type_payment'],
            adreese_send=serializer.validated_data['adreese_send'],
            user=self.request.user
        )
        # Variables para venta
        amount = 0
        count = 0
        # Recuperamos los productos de venta
        productos= Product.objects.filter(
            id__in=serializer.validated_data['productos']
        )
        #
        cantidades = serializer.validated_data['cantidades']
        
        #
        ventas_detalle = []
        for producto, cantidad in zip(productos, cantidades):
            venta_detalle = SaleDetail(
                sale=venta,
                product=producto,
                count=cantidad,
                price_purchase=producto.price_purchase,
                price_sale=producto.price_sale
            )
            #
            amount +=  producto.price_sale*cantidad
            count +=  cantidad
            ventas_detalle.append(venta_detalle)

        venta.amount = amount
        venta.count = count
        venta.save()
        #
        SaleDetail.objects.bulk_create(ventas_detalle)
        return Response({
            'msj':'Venta exitosa'
        })