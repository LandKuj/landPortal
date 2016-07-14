# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-25 16:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0039_auto_20160625_1333'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='prod_task',
            name='production',
        ),
        migrations.RemoveField(
            model_name='prod_task',
            name='task',
        ),
        migrations.RemoveField(
            model_name='task_part',
            name='part',
        ),
        migrations.RemoveField(
            model_name='task_part',
            name='task',
        ),
        migrations.DeleteModel(
            name='Task_Step',
        ),
        migrations.AlterField(
            model_name='part',
            name='sub_type',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.DeleteModel(
            name='Prod_Task',
        ),
        migrations.DeleteModel(
            name='Task',
        ),
        migrations.DeleteModel(
            name='Task_Part',
        ),
    ]
