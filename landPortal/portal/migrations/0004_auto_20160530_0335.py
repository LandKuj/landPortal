# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-05-30 03:35
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0003_employee_emp_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employee',
            name='emp_id',
        ),
        migrations.RemoveField(
            model_name='shift',
            name='shift_id',
        ),
        migrations.AddField(
            model_name='employee',
            name='id',
            field=models.AutoField(auto_created=True, default=datetime.datetime(2016, 5, 30, 3, 35, 8, 367226, tzinfo=utc), primary_key=True, serialize=False, verbose_name='ID'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='shift',
            name='id',
            field=models.AutoField(auto_created=True, default=datetime.datetime(2016, 5, 30, 3, 35, 18, 455051, tzinfo=utc), primary_key=True, serialize=False, verbose_name='ID'),
            preserve_default=False,
        ),
    ]
