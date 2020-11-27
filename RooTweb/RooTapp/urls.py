from django.urls import path
from RooTapp import views



urlpatterns = [
    path('', views.home, name='Home'),
    path('shop/', views.shop, name='Shop'),
    path('blog/', views.blog, name='Blog'),
    path('contact/', views.contact, name='Contact'),
]

