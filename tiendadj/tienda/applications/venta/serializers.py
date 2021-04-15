from rest_framework import serializers

from .models import Sale, SaleDetail

class ventaReporteSerializers(serializers.ModelSerializer):
    """ Serializador para ver las ventas en detalle """

    productos = serializers.SerializerMethodField()

    class Meta:
        model= Sale
        fields= (
            'id',
            'date_sale',
            'amount',
            'count',
            'type_invoce',
            'cancelado',
            'type_payment',
            'state',
            'adreese_send',
            'user',
            'productos',
        )
    
    def get_productos(self, obj):
        query = SaleDetail.objects.productos_por_venta(obj.id)
        productos_serializados = DetalleVentadProductoSerializer(query, many=True).data
        return productos_serializados

class DetalleVentadProductoSerializer(serializers.ModelSerializer):

    class Meta:
        model = SaleDetail
        fields = (
            'id',
            'sale',
            'product',
            'count',
            'price_purchase',
            'price_sale',
        )

class ProductDetailSerializer(serializers.Serializer):

    pk = serializers.IntegerField()
    count = serializers.IntegerField()

class ProcesoVentaSerializer(serializers.Serializer):

    type_invoce = serializers.CharField()
    type_payment = serializers.CharField()
    adreese_send = serializers.CharField()
    productos = ProductDetailSerializer(many=True)




