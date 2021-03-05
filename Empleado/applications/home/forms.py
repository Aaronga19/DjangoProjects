from django import forms
from .models import Prueba

class PruebaForm(forms.ModelForm):
    """Form definition for Prueba."""

    class Meta:
        """Meta definition for Pruebaform."""

        model = Prueba
        fields = ('titulo', 'subtitulo','cantidad')
        widgets = {
            'cantidad': forms.TextInput(attrs=
            {'placeholder': '¿Cuántos artículos llegaron?'}),
            'titulo': forms.TextInput(attrs=
            {'placeholder': "Ingrese el título"}),
        }

    def clean_cantidad(self):
        cantidad = self.cleaned_data['cantidad']
        if cantidad < 10:
            raise forms.ValidationError("Ingrese un número mayor a 10")
            
        return cantidad

