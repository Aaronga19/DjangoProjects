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
    # Serializer form
    path('api/personas/', 
    views.PersonApiLista.as_view(),
    name='form-api'
    ),
    path('api/reuniones/', 
    views.ReunionApiLista.as_view(),
    name='reuniones-api'
    ),
    path('api/reunionesLink/', 
    views.ReunionApiListaLink.as_view(),
    name='reunionesLink-api'
    ),
    path('api/personas/paginacion/', 
    views.PersonPaginationList.as_view(),
    name='personasPagination-api'
    ),
    path('api/reunion/per-job/', 
    views.ReunionByPersonJobs.as_view(),
    name='reunionPerson-api'
    ),
]

