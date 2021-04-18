from rest_framework import viewsets
from rest_framework.response import Response

from .models import Colors, Product
#
from .serializers import ColorSerializer, ProductSerializer, PaginationSerializer, ProductSerializerViewset

class ColorViewset(viewsets.ModelViewSet):
    
    serializer_class = ColorSerializer
    queryset = Colors.objects.all()

class ProductViewset(viewsets.ModelViewSet):
    
    serializer_class = ProductSerializerViewset
    queryset = Product.objects.all()
    pagination_class = PaginationSerializer    

    def perform_create(self, serializer):
        serializer.save(
            video="https://www.youtube.com/watch?v=5y8HVM5g-WU",
        )

    def list(self, request, *args, **kwargs):
        queryset = Product.objects.productos_por_user(self.request.user)
        #
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

