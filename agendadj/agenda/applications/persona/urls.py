from django.urls import path
from django import views
from . import views

app_name = 'persona_app'

urlpatterns = [
    path('personas/', 
    views.ListaPersona.as_view(),
    name='personas'
    ),
    path('api/persona/lista/', 
    views.PersonListApiView.as_view(),
    name='personas-api'
    ),
    path('lista/', 
    views.PersonListView.as_view(),
    name='lista'
    ),
    path('api/persona/search/<kword>/', 
    views.PersonSearchApiView.as_view(),
    name='search-api'
    ),
    path('api/persona/create/', 
    views.PersonCreateView.as_view(),
    name='create-api'
    ),
    path('api/persona/detail/<pk>/', 
    views.PersonDetailView.as_view(),
    name='detail-api'
    ),
    path('api/persona/delete/<pk>/', 
    views.PersonDeleteView.as_view(),
    name='delete-api'
    ),
    path('api/persona/update/<pk>/', 
    views.PersonUpdateView.as_view(),
    name='update-api'
    ),
    path('api/persona/modify/<pk>/', 
    views.PersonRetrieveUpdateView.as_view(),
    name='modify-api'
    ),
]

