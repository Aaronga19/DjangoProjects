from rest_framework import serializers, pagination
from .models import Person, Reunion, Hobby

class PersonSerializer(serializers.ModelSerializer):

    class Meta:
        model = Person
        fields = ('__all__')

        """
            'id',
            'full_name',
            'job',
            'email',
        """

class PersonaSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    full_name = serializers.CharField()
    job = serializers.CharField()
    email = serializers.EmailField()
    phone = serializers.CharField()
    # extra fields
    activo = serializers.BooleanField(required=False)


class PersonaSerializer2(serializers.ModelSerializer):
    activo = serializers.BooleanField(default=False)

    class Meta:
        model = Person
        fields = ('__all__')


class HobbySerializer(serializers.ModelSerializer):

    class Meta:
        model = Hobby
        fields = ('__all__')


class PersonaSerializer3(serializers.ModelSerializer):

    hobbies = HobbySerializer(many=True)

    class Meta:
        model = Person
        fields = (
            'id',
            'full_name',
            'job',
            'email',
            'phone',
            'hobbies',
            'created'
        )


class ReunionSerializer(serializers.ModelSerializer):

    persona = PersonaSerializer3()

    class Meta:
        model = Reunion
        fields = (
            'id',
            'fecha',
            'hora',
            'persona',
        )


class ReunionSerializer2(serializers.ModelSerializer):
    persona = PersonaSerializer3()
    fecha_hora = serializers.SerializerMethodField()

    class Meta:
        model = Reunion
        fields = (
            'id',
            'fecha_hora',
            'persona'
            
        )
    
    def get_fecha_hora(self, obj):
        return f"{str(obj.fecha)} - {str(obj.hora)}"


class ReunionSerializerLink(serializers.HyperlinkedModelSerializer):



    class Meta:
        model = Reunion
        fields = (
            'id',
            'fecha',
            'hora',
            'asunto',
            'persona',
            
        )
        extra_kwargs = {
            'persona': {'view_name':'persona_app:detail-api', 'lookup_field':'pk'}
        }


class PersonPagination(pagination.PageNumberPagination):
    page_size = 5
    max_page_size = 100


class CountReunionSerializer(serializers.Serializer):
    persona__job = serializers.CharField()
    cantidad = serializers.IntegerField()