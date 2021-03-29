from django.db import models
# apps terceros
from model_utils.models import TimeStampedModel



class Home(TimeStampedModel):
    """ Modelo para datos de la pantalla Home """
    title = models.CharField(
        'Nombre',
        max_length=30
        )
    description = models.TextField()
    about_title = models.CharField(
        'Acerca del titulo',
        max_length=50
        )
    about_text = models.TextField()
    contact_email = models.EmailField(
        'Email de contacto', 
        blank=True,
        null=True
        )
    phone = models.CharField(
        'Telefono de contacto', 
        max_length=20
        )
    class Meta:
        verbose_name = 'Página Principal'
        verbose_name_plural = 'Página Principal'

    def __str__(self):
        return self.title

class Subscribers(TimeStampedModel):
    """Model definition for Subscribers."""

    email = models.EmailField()

    class Meta:
        """Meta definition for Subscribers."""

        verbose_name = 'Suscriptor'
        verbose_name_plural = 'Suscriptores'

    def __str__(self):
        """Unicode representation of Subscribers."""
        return self.email

class Contact(TimeStampedModel):
    """Model definition for Contact."""

    full_name = models.CharField(
        'Nombres', 
        max_length=60
        )
    email = models.EmailField()
    messagge = models.TextField()

    class Meta:
        """Meta definition for Contact."""

        verbose_name = 'Contacto'
        verbose_name_plural = 'Mensajes'

    def __str__(self):
        """Unicode representation of Contact."""
        return self.full_name

