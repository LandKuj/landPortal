# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-23 02:12
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0028_auto_20160623_0209'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='part',
            name='supplier',
        ),
        migrations.RemoveField(
            model_name='prod_sch',
            name='order_item',
        ),
        migrations.RemoveField(
            model_name='prod_sch',
            name='production',
        ),
        migrations.RemoveField(
            model_name='purchase',
            name='supplier',
        ),
        migrations.RemoveField(
            model_name='task',
            name='production',
        ),
        migrations.RemoveField(
            model_name='task_part',
            name='task',
        ),
        migrations.DeleteModel(
            name='Task_Step',
        ),
        migrations.DeleteModel(
            name='Part',
        ),
        migrations.DeleteModel(
            name='Prod_Sch',
        ),
        migrations.DeleteModel(
            name='Production',
        ),
        migrations.DeleteModel(
            name='Purchase',
        ),
        migrations.DeleteModel(
            name='Task',
        ),
        migrations.DeleteModel(
            name='Task_Part',
        ),
    ]
