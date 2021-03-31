from django.shortcuts import render

from django.views.generic import TemplateView

from rest_framework.views import APIView
from .serializers import loginSocialSerializer
# Create your views here.


class LoginUser(TemplateView):
    template_name = "users/login.html"


class GoogleLoginView(APIView):
    serializer_class = loginSocialSerializer
    
    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        #serializer = loginSocialSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        #
        id_token = serializer.data.get('token_id')
        #
        
        return None