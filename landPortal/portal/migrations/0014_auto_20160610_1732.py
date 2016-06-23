# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-10 17:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0013_product'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='prod_internalID',
            field=models.CharField(max_length=100, null=True, unique=True),
        ),
        migrations.AddField(
            model_name='product',
            name='prod_purchase',
            field=models.NullBooleanField(),
        ),
        migrations.AlterField(
            model_name='product',
            name='prod_name',
            field=models.CharField(max_length=100),
        ),
    ]
