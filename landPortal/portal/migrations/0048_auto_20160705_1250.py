# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-07-05 12:50
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0047_invoice'),
    ]

    operations = [
        migrations.AlterField(
            model_name='task_part',
            name='part',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='portal.Part'),
        ),
    ]