from rest_framework.routers import DefaultRouter

from . import viewsets

router = DefaultRouter()

router.register(r'ventas', viewsets.VentasViewset, basename="ventas")

urlpatterns = router.urls