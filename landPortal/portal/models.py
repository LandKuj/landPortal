from __future__ import unicode_literals
from django.contrib.auth.models import User

import datetime
from django.db import models
from portal.models import *


        


class Employee(models.Model):
       	emp_user = models.OneToOneField(User, null=True)
        emp_name = models.CharField(max_length=100)
        emp_phone = models.CharField(max_length=50)
        emp_address = models.CharField(max_length=100, null=True)
        emp_city = models.CharField(max_length=50, null=True)
        emp_state = models.CharField(max_length=50, null=True)
        emp_zip = models.CharField(max_length=20, null=True)
	emp_start_date = models.DateTimeField(null=True)
	emp_level = models.CharField(max_length=20)
	emp_active = models.NullBooleanField(null=True)
	emp_notes = models.TextField(null=True)

	def getName(self):
		return self.emp_name

	def getId(self):
		return self.id

	def isClockedIn(self):
		nullShift = Shift.objects.filter(emp_id__exact= self)
		nullShift = nullShift.filter(shift_out__isnull = True)

		if nullShift.count() == 0:
			return False
		else:
			return True

	def isActive(self):
		return self.emp_active



class Shift(models.Model):
       # shift_id = models.CharField(max_length=30, null=False, primary_key=True)
        emp_id = models.ForeignKey(Employee)
	shift_in = models.DateTimeField()
        shift_out = models.DateTimeField(null=True)
        shift_notes = models.TextField(null=True)

	def getShiftStart(self):
		return self.shift_in

	def getShiftEnd(self):
		if self.shift_out is None:
			return datetime.datetime.now()
		else:
			return self.shift_out


## Class for storing arbitrary needs such as equipment
class Thing(models.Model):
        name = models.CharField(max_length=200)
        desc = models.CharField(max_length=500)
        employee = models.ForeignKey(Employee)


class Customer(models.Model):
	name = models.CharField(max_length=50)
	address = models.CharField(max_length=150, null=True)
	city = models.CharField(max_length=50, null=True)
	state = models.CharField(max_length=50, null=True)
	zip = models.CharField(max_length=50, null=True)
	phone = models.CharField(max_length=50, null=True)
	phone2 = models.CharField(max_length=50, null=True)
	email = models.CharField(max_length=100, null=True)
	notes = models.TextField(null=True)


class Order(models.Model):
	cust_id = models.OneToOneField(Customer, null=True)
        internalID = models.CharField(max_length=50,null=True)
	order_date = models.DateTimeField()
	exp_order_date = models.DateField(null=True)
	order_type = models.CharField(max_length=100, null=True)
	ship_method = models.CharField(max_length=200, null=True)
	payment_terms = models.CharField(max_length=200, null=True)
	priority = models.CharField(max_length=50, null=True)

	#
	# 1. Placed (Entered into System)
	# 2. In Production (Being Built)
	# 3. In Finishing (Being Put together)
	# 4. Finished (Ready for Pickup or shipping)
	# 5. Completed
        status_choices = (
                ('Placed', 'Placed'),
                ('Production', 'Production'),
                ('Paint', 'Paint'),
                ('Finishing', 'Finishing'),
                ('Completed', 'Completed'),
                ('Shipped', 'Shipped')
        )
	status = models.CharField(max_length=100, null=True)
	order_flag = models.CharField(max_length=50, null=True)
	order_flag2 = models.CharField(max_length=50, null=True)
	order_flag3 = models.CharField(max_length=50, null=True)
	order_notes = models.TextField(null=True)

        def getID(self):
                return self.id







class Product(models.Model):
	prod_name = models.CharField(max_length=100, null=False)
	prod_internalID = models.CharField(max_length=100, unique=True)
	prod_desc = models.CharField(max_length=300, null=True)
        prod_type = models.CharField(max_length=150, null=False)
	prod_purchase = models.NullBooleanField(null=True)
	prod_active = models.NullBooleanField(null=True)
	prod_flag = models.CharField(max_length=100, null=True)
	prod_price = models.FloatField(null=True)
	prod_notes = models.TextField(null=True)

	def getName(self):
		return self.prod_name

        def getID(self):
                return self.id


class OrderItem(models.Model):
	order = models.ForeignKey(Order)
	product = models.ForeignKey(Product, null=True)
	quantity = models.IntegerField(null=True)
	item_notes = models.TextField(null=True)



class Supplier(models.Model):
	name = models.CharField(max_length=100)
	address = models.CharField(max_length=150, null=True)
	city = models.CharField(max_length=100, null=True)
	state = models.CharField(max_length=100, null=True)
	zip = models.CharField(max_length=30, null=True)
	phone = models.CharField(max_length=50, null=True)
	phone2 = models.CharField(max_length=50, null=True)
	notes = models.TextField(null=True)


class Part(models.Model):
	name = models.CharField(max_length=150)
	desc = models.CharField(max_length=200, null=True)
	# Part Types:
        # 1. Steel - Raw
        # 2. Steel - Cut
        # 3. Bolts/Nuts/Washers
        # 4. Manufactured - Input // Used for input only items
        # 5. Manufactured - Output // Used for parts closer to the customer
        # 6. Lights/Wiring
        # 7. Painting
        # 8. Equipment
        # 9. Tongue
        # 10. Body
        # 11. Accessories
        # 12. Tires
        # 13. Misc
        # 14. Ramps/Rockguard
        # 15. Replacement Parts
        part_type_choices = (
                ('Steel - Raw', 'Steel - Raw'),
                ('Steel - Cut', 'Steel - Cut'),
                ('Bolts/Nuts/Washers', 'Bolts/Nuts/Washers'),
                ('Manufactured - Input', 'Manufactured - Input'),
        )       
        type = models.CharField(max_length=100)
        unit = models.CharField(max_length=150, null=True)
        supplier = models.OneToOneField(Supplier, null=True)
	supplier_part_id = models.CharField(max_length=50, null=True, unique=True)
	internal_part_id = models.CharField(unique=True, null=True, max_length=50)
	sell_price = models.FloatField(null=True)
	quantity = models.IntegerField()
	notes = models.TextField(null=True)



class Purchase(models.Model):
	supplier = models.ForeignKey(Supplier)
	date = models.DateField()
	notes = models.TextField(null=True)


# Purchase breakdown table
#class Purchase_Parts(models.Model):
#	purchase = models.ForeignKey(Purchase)
#	part = models.ForeignKey(Part)
#	quantity = models.IntegerField()
#	price = models.FloatField()
#	notes = models.TextField(null=True)


class Production(models.Model):
#	part = models.OneToOneField(Part)
	name = models.CharField(max_length=150)
	desc = models.CharField(max_length=200, null=True)
	# This should be a choice field
	type = models.CharField(max_length=100, null=True)
	notes = models.TextField(null=True)


# Tasks tie to Production
class Task(models.Model):
	production = models.ForeignKey(Production)
	name = models.CharField(max_length=150)
	desc = models.CharField(max_length=200, null=True)
        order = models.IntegerField(null=True)
	# This needs to be a choice
        type = models.CharField(max_length=100, null=True)
	notes = models.TextField(null=True)


class Task_Part(models.Model):
        task = models.ForeignKey(Task)
#        part = models.OneToOneField(Part)
        quantity = models.IntegerField()
        

class Task_Step(models.Model):
        name = models.CharField(max_length=200)
        desc = models.CharField(max_length=500, null=True)
        order = models.IntegerField()
        notes = models.TextField(null=True)


# Active Production tied to Order Items
class Prod_Sch(models.Model):
	production = models.ForeignKey(Production)
	order_item = models.OneToOneField(OrderItem, null=True)
	status = models.CharField(max_length=50, null=True)
	location = models.CharField(max_length=100, null=True)
	notes = models.TextField(null=True)






