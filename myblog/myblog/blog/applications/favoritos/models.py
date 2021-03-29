from django.db import models
from django.conf import settings
from applications.entrada.models import Entry
# Apps de terceros
from model_utils.models import TimeStampedModel
# Create your models here.
from .managers import FavoritesManager

class Favorites(TimeStampedModel):
    """Model definition for Favorites."""

    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        related_name='user_favorites',
        on_delete = models.CASCADE,
    )
    entry = models.ForeignKey(
        Entry,
        related_name= 'entry_favorites',
        on_delete=models.CASCADE,
    )
    objects = FavoritesManager()

    class Meta:
        """Meta definition for Favorites."""
        unique_together = ('user', 'entry')
        verbose_name = 'Entrada Favorita'
        verbose_name_plural = 'Entradas Favoritas'

    def __str__(self):
        """Unicode representation of Favorites."""
        return self.entry.title
