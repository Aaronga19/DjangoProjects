# Generated by Django 3.0.3 on 2021-03-16 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('autor', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='autor',
            name='seudonimo',
            field=models.CharField(blank=True, max_length=50, verbose_name='Seudonimo'),
        ),
    ]
