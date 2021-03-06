# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-05 00:10
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0011_employee_emp_active'),
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('address', models.CharField(max_length=150, null=True)),
                ('city', models.CharField(max_length=50, null=True)),
                ('state', models.CharField(max_length=50, null=True)),
                ('zip', models.CharField(max_length=50, null=True)),
                ('phone', models.CharField(max_length=50, null=True)),
                ('phone2', models.CharField(max_length=50, null=True)),
                ('email', models.CharField(max_length=100, null=True)),
                ('notes', models.TextField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order_date', models.DateTimeField()),
                ('exp_order_date', models.DateTimeField(null=True)),
                ('order_type', models.CharField(max_length=100, null=True)),
                ('ship_method', models.CharField(max_length=200, null=True)),
                ('payment_terms', models.CharField(max_length=200, null=True)),
                ('priority', models.CharField(max_length=50, null=True)),
                ('status', models.CharField(max_length=100, null=True)),
                ('order_flag', models.CharField(max_length=50, null=True)),
                ('order_flag2', models.CharField(max_length=50, null=True)),
                ('order_flag3', models.CharField(max_length=50, null=True)),
                ('order_notes', models.TextField(null=True)),
                ('cust_id', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='portal.Customer')),
            ],
        ),
    ]
