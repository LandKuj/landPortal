# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-23 02:42
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0031_supplier'),
    ]

    operations = [
        migrations.CreateModel(
            name='Part',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('desc', models.CharField(max_length=200, null=True)),
                ('type', models.CharField(max_length=100)),
                ('unit', models.CharField(max_length=150, null=True)),
                ('supplier_part_id', models.CharField(max_length=50, null=True, unique=True)),
                ('internal_part_id', models.CharField(max_length=50, null=True, unique=True)),
                ('sell_price', models.FloatField(null=True)),
                ('quantity', models.IntegerField()),
                ('notes', models.TextField(null=True)),
                ('supplier', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='portal.Supplier')),
            ],
        ),
        migrations.CreateModel(
            name='Production',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('desc', models.CharField(max_length=200, null=True)),
                ('type', models.CharField(max_length=100, null=True)),
                ('notes', models.TextField(null=True)),
                ('part', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='portal.Part')),
            ],
        ),
        migrations.CreateModel(
            name='Purchase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('notes', models.TextField(null=True)),
                ('supplier', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='portal.Supplier')),
            ],
        ),
        migrations.CreateModel(
            name='Purchase_Parts',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField()),
                ('price', models.FloatField()),
                ('notes', models.TextField(null=True)),
                ('part', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='portal.Part')),
                ('purchase', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='portal.Purchase')),
            ],
        ),
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('desc', models.CharField(max_length=200, null=True)),
                ('order', models.IntegerField(null=True)),
                ('type', models.CharField(max_length=100, null=True)),
                ('notes', models.TextField(null=True)),
                ('production', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='portal.Production')),
            ],
        ),
        migrations.CreateModel(
            name='Task_Part',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField()),
                ('part', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='portal.Part')),
                ('task', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='portal.Task')),
            ],
        ),
        migrations.CreateModel(
            name='Task_Step',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('desc', models.CharField(max_length=500, null=True)),
                ('order', models.IntegerField()),
                ('notes', models.TextField(null=True)),
            ],
        ),
    ]
