# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-12 19:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0015_orderitem'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='exp_order_date',
            field=models.DateField(null=True),
        ),
    ]
