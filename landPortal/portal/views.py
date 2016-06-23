from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from django.shortcuts import render, render_to_response, redirect

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

from django.forms.formsets import formset_factory
from django.forms import modelformset_factory
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.db import IntegrityError, transaction


import datetime
import os

from portal.models import *
from .forms import *

def index(request):

	if request.user.is_authenticated():
		return HttpResponseRedirect('/portal/home')
		
	login_form = SiteLoginForm

        if request.method == 'POST':
                form = login_form(data=request.POST)

                if not (form.is_valid()):
                        return HttpResponse("Incorrect Username or Password")

                if form.is_valid():
                        username = request.POST.get('username', '')
                        password = request.POST.get('password', '')

                        user = authenticate(username=username, password=password)

                        if user:
                                if user.is_active:
                                        login(request, user)
                                        return HttpResponseRedirect('/portal/home')
                                else:
                                        return HttpResponse("Username is disabled")
                else:
                        return HttpResponse("Invalid Login Credientials")

        return render(request, 'portal/login.html', { 'form' : login_form } )


def add_thing(request):
	
	if request.user.is_authenticated():
		employee_ob = Employee.objects.get(emp_user=request.user)
		if request.method == 'POST':
				
				inData = request.POST
				
				new_thing = Thing(name=inData['name'], desc=inData['desc'], employee=employee_ob)
				new_thing.save()
				
				return HttpResponseRedirect("http://landmfg.com/portal/view_things")
		
		else: 
				thing_form = ThingForm()
				
				context = { 'thing_form' : thing_form, }
				
				return render(request, 'portal/thing_form.html', context)
				

def delete_thing(request, thing_id):
	
	if request.user.is_authenticated():
		
		delete_thing = Thing.objects.get(id=thing_id)
		delete_thing.delete()
		
		return HttpResponseRedirect("http://landmfg.com/portal/view_things")


def view_things(request):
	if request.user.is_authenticated():
		
		things = Thing.objects.all()
		
		thing_names = []
		thing_desc = []
		thing_employee_name = []
		thing_ids = []
		for thing in things:
			thing_ids.append(thing.id)
			thing_names.append(thing.name)
			thing_desc.append(thing.desc)
			thing_employee_name.append(thing.employee.emp_name)
			
		
		context = { 'thing_names' : thing_names, 'thing_desc' : thing_desc, 'thing_employee_name' : thing_employee_name, 'thing_ids' : thing_ids, }
		
		return render(request, 'portal/thing_show.html', context)



def home(request):
	if not(request.user.is_authenticated()):
		return HttpResponseRedirect('/portal/not_allowed')
	else:
		employee = Employee.objects.get(emp_user=request.user)
		if employee.emp_level == 'employee':
			return HttpResponseRedirect('/portal/employee_dash/' + str(employee.id) + '/' + getDateString(datetime.datetime.today()))
		elif employee.emp_level == 'office':
			today_temp = datetime.datetime.today()
			summary_url = '/portal/employee_summary/' + getDateString(today_temp)
			return HttpResponseRedirect(summary_url)


def getDateString(temp_date):
	temp_year = str(temp_date.year)[2:]
	temp_month = temp_date.month
	if temp_month < 10:
		temp_month = "0" + str(temp_month)
	temp_month = str(temp_month)
	temp_day = temp_date.day
	if temp_day < 10:
		temp_day = "0" + str(temp_day)
	temp_day = str(temp_day)
	return temp_day + temp_month + temp_year




def not_allowed(request):
	return render(request, 'portal/not_allowed.html', {})


def logout_page(request):
	logout(request)
	return render(request, 'portal/log_out.html', {})





def employee_dash(request, emp_id, week_start):

	if request.user.is_authenticated():

		employee_visit = Employee.objects.get(emp_user = request.user)
		employee_dash = Employee.objects.get(id = emp_id)

		# Should be office, returns the page for the requested employee
		if employee_visit.emp_level == 'employee' or 'office':
			employee_name = employee_dash.emp_name
			loggedIn = employee_dash.isClockedIn()

			hold_friday = datetime.date(2016, 5, 27)

	                os.environ['TZ'] = 'US/Central'

			if week_start != None:
                		today_date = datetime.date( 2000 + int(week_start[4:6]), int(week_start[2:4]), int(week_start[0:2]))
                	else:
				today_date = datetime.datetime.today()

			date_dif = today_date - hold_friday

                	days_back = date_dif.days % 7

                	week_begin = today_date - datetime.timedelta(days=days_back)
                	week_end = today_date - datetime.timedelta(days=days_back) + datetime.timedelta(days=7)

			employee_shifts = Shift.objects.filter(emp_id = employee_dash).order_by('shift_in')
               	 	shifts_this_week = employee_shifts.filter(shift_in__range=(week_begin, week_end))


			shift_date_list = []
                	shift_start_list = []
                	shift_end_list = []
                	shift_hours_list = []
                	shift_raw_hours_list = []

               		for shift in shifts_this_week:
                        	shift_start = shift.getShiftStart()
                        	shift_end = shift.getShiftEnd()

                        	shift_start = datetime.datetime(shift_start.year, shift_start.month, shift_start.day, shift_start.hour, shift_start.minute)
                        	shift_end = datetime.datetime(shift_end.year, shift_end.month, shift_end.day, shift_end.hour, shift_end.minute)

                        	shift_date_list.append(shift_start.date())
                        	shift_start_list.append(shift_start.time())
                        	shift_end_list.append(shift_end.time())

				if shift_end != None:
                               		shift_hours_temp = shift_end - shift_start
                               		shift_raw_hours_list.append(shift_hours_temp.seconds)

                               		num_hours = (shift_hours_temp.seconds / 3600)
                               		num_min = (shift_hours_temp.seconds % 3600) / 60

                               		shift_hours_list.append(str(num_hours) + ' hours  ' + str(num_min) + ' min ')


			total_hours_temp = sum(shift_raw_hours_list)
		        hours = total_hours_temp / 3600
               		min = (total_hours_temp % 3600) / 60
                	total_hours = str(hours) + ' hours  ' + str(min) + ' min '

                	shift_hours = 0

                	if employee_dash.isClockedIn:
                        	if not (not shift_hours_list):
                               		shift_hours = shift_hours_list[len(shift_hours_list) - 1]
                		else:
              				shift_hours = 0

			return render(request, 'portal/employee_dash.html', {'employeeName' : employee_name, 'loggedIn' : loggedIn,
                                                                     'today_date' : today_date, 'week_begin' : week_begin, 'week_end' : week_end,
                                                                     'shift_date_list' : shift_date_list, 'shift_start_list' : shift_start_list,
                                                                     'shift_end_list' : shift_end_list, 'shift_hours_list' : shift_hours_list,
                                                                     'total_hours' : total_hours, 'shift_hours' : shift_hours,        })


		else:
			return HttpResponse("This is the problem")





def employee_summary_week(request, week_start):

	if request.user.is_authenticated():
		employee = Employee.objects.get(emp_user = request.user)

		if employee.emp_level == 'office':
			hold_friday = datetime.date(2016, 5, 27)

			os.environ['TZ'] = 'US/Central'

			today_date_static = datetime.datetime.today()
			today_date = datetime.date( 2000 + int(week_start[4:6]), int(week_start[2:4]), int(week_start[0:2])   )
			date_dif = today_date - hold_friday
			days_back = date_dif.days % 7

			week_begin = today_date - datetime.timedelta(days=days_back)
			week_end = today_date - datetime.timedelta(days=days_back) + datetime.timedelta(days=7)

			back_week_string = "http://landmfg.com/portal/employee_summary/" + getDateString(today_date - datetime.timedelta(days=7))
			forward_week_string = "http://landmfg.com/portal/employee_summary/" + getDateString(today_date + datetime.timedelta(days=7))
			current_week_string = "http://landmfg.com/portal/employee_summary/" + getDateString(today_date_static)

			shifts_this_week = Shift.objects.filter(shift_in__range=(week_begin, week_end))

			employees = Employee.objects.filter(emp_active=True)
			employee_names = []
			employee_work_time = []
			employee_dec_time = []
			employee_in = []
			employee_active = []
			employee_id = []

			for emp in employees:
				employee_names.append(emp.emp_name)
				employee_in.append(emp.isClockedIn())
				employee_active.append(emp.isActive())
				employee_id.append("http://landmfg.com/portal/employee_dash/" + str(emp.id) + '/' + getDateString(today_date))
				
				employee_shifts = Shift.objects.filter(emp_id = emp)
				shifts_this_week = employee_shifts.filter(shift_in__range=(week_begin, week_end))
				temp_time = []
				for shift in shifts_this_week:
					shift_start = shift.getShiftStart()
					shift_end = shift.getShiftEnd()
					shift_start = datetime.datetime(shift_start.year, shift_start.month, shift_start.day, shift_start.hour, shift_start.minute)
					shift_end = datetime.datetime(shift_end.year, shift_end.month, shift_end.day, shift_end.hour, shift_end.minute)
					shift_time = shift_end - shift_start
					temp_time.append(shift_time.seconds)

				total_time = sum(temp_time)
				employee_work_time.append( str(total_time / 3600) + ' hours ' +
							   str( (total_time % 3600) / 60) + ' min')
				employee_dec_time.append( round((total_time / 3600.0), 2) )

			# Edit week_end for display after query
			week_end = week_end - datetime.timedelta(days=1)

			return render(request, 'portal/emp_summary.html', {'employee_names' : employee_names, 'employee_in' : employee_in,
									    'employee_work_time' : employee_work_time, 'employee_active' : employee_active,
									    'today_date' : today_date, 'week_begin' : week_begin, 'week_end' : week_end,
									    'today_date_static' : today_date_static, 'employee_dec_time' : employee_dec_time,
									    'employee_id' : employee_id, 'back_week_string' : back_week_string,
									    'forward_week_string' : forward_week_string, 'current_week_string' : current_week_string,  } )
		else:
                         return HttpResponseRedirect('/portal/not_allowed')





def employee_dashboard(request):
	if request.user.is_authenticated():
		employee = Employee.objects.get(emp_user = request.user)
		if employee.emp_level =='employee':
			return HttpResponseRedirect( ('/portal/employee_dash/' + str(employee.id) + '/' + getDateString(datetime.datetime.today()) ) )

	else:
		return HttpResponse("This is the actual problem")



def login_employee(request):

	if request.user.is_authenticated():
		employee = Employee.objects.get(emp_user = request.user)

		if employee.emp_level == 'employee':

			os.environ['TZ'] = 'US/Central'

			if not employee.isClockedIn():

				newShift = Shift(shift_in = datetime.datetime.now(), emp_id = employee)
				newShift.save()

			return HttpResponseRedirect('/portal/employee_dashboard/')

		else:
			return HttpResponseRedirect('portal/not_allowed')


def logout_employee(request):

	if request.user.is_authenticated():

		employee = Employee.objects.get(emp_user = request.user)

		shiftList = Shift.objects.filter(emp_id = employee)
		currentShift = shiftList.get(shift_out__isnull = True)

		os.environ['TZ'] = 'US/Central'

		currentShift.shift_out = datetime.datetime.now()
		currentShift.save()

		return HttpResponseRedirect('/portal/employee_dashboard')







##################### ORDER VIEWS ##########################

def order_dash(request):
	if request.user.is_authenticated():

		employee = Employee.objects.get(emp_user = request.user)

		if employee.emp_level == 'office':
			current_orders = Order.objects.all().exclude(status='Shipped').order_by('exp_order_date')
			
			customer = []
			order_in_date = []
			order_due_date = []
			order_internal_id = []
			order_status = []
			order_ship_method = []
			order_priority = []
			for order in current_orders:
				customer_obj = Customer.objects.get(id=order.cust_id.id)
				customer.append(customer_obj.name)
			
				order_internal_id.append(order.internalID)
				order_in_date.append(order.order_date.date())
				order_due_date.append(order.exp_order_date)
				order_status.append(order.status)
				order_ship_method.append(order.ship_method)
				order_priority.append(order.priority)
				
			context = {'customer' : customer, 'order_in_date' : order_in_date, 'order_due_date' : order_due_date,
					   'order_internal_id' : order_internal_id, 'order_status' : order_status,
					   'order_ship_method' : order_ship_method, 'order_priority' : order_priority } 

			return render(request, 'portal/order_dash.html', context)

###### CREATE PAGE TO EDIT ACTIVE ORDERS!!!! #########

def genOrderID():
	last_order = Order.objects.all().last()
	return "OR-" + str(last_order.id)

def getEmployee(user):
	employee = Employee.objects.get(emp_user=user)
	return employee

### ORDER #### Page for showing order detail
## Displays detail for a selected order
## Show all items included in the order
## Show production associated with order
## Provide links for editing order
## Provide links for viewing production detail
## MOR
def order_detail(request, order_id):
	
	if request.user.is_authenticated():
		if getEmployee(request.user).emp_level == 'office':
			
			if request.method == 'POST':
				
				inData = request.POST
				new_status = request.POST['status']
				order = Order.objects.get(internalID=order_id)
				order.status = new_status
				order.save()
				
				return HttpResponse(new_status)
			
			else:
				
				### Get order object ###
				view_order = Order.objects.get(internalID=order_id)
				
				### Get QuerySet of items associated with order ###
				items_set = OrderItem.objects.filter(order=view_order)
				### Get a list of products from associated with items ###
				product_name_list = []
				product_desc_list = []
				product_quantity_list = []
				product_notes_list = []
				for item in items_set:
					product_name_list.append(item.product.prod_name)
					product_desc_list.append(item.product.prod_desc)
					product_quantity_list.append(item.quantity)
					product_notes_list.append(item.item_notes)
					
					
					
				order_id_num = order_id[3:]
				status_form = StatusForm()
				
				### Move set into list for template table display ###
				
				### Create Context Dictionary
				context = { 'order_id' : order_id, 'order_id_num' : order_id_num, 'product_name_list' : product_name_list,
						   'product_desc_list' : product_desc_list, 'product_quantity_list' : product_quantity_list,
						   'product_notes_list' : product_notes_list, 'status_form' : status_form, }
				
				return render(request, 'portal/order_detail.html', context)
		



#### ORDER #### Page for creating new orders
def create_new_order(request):

	user = request.user
	employee = Employee.objects.get(emp_user=user)

	if request.user.is_authenticated():
		if employee.emp_level == 'office':

			OrderItemSet = formset_factory(OrderItemForm, formset=BaseOrderItemSet)

			if request.method == 'POST':
					inData = request.POST
					cust_yes_no = inData['create_customer']
					if cust_yes_no:
						newCustomer = Customer(name=inData['name'], address=inData['address'], city=inData['city'],
								       state=inData['state'], zip=inData['zip'], phone=inData['phone'],
								       email=inData['email'] )
						newCustomer.save()

						newOrder = Order(cust_id=newCustomer, order_date=datetime.datetime.today(),
								 exp_order_date=inData['exp_date'], order_type=inData['order_type'],
								 ship_method=inData['ship_method'], payment_terms=inData['payment_terms'],
								 priority=inData['priority'], order_notes=inData['order_notes'],
								 status='Placed', internalID=genOrderID() )
						newOrder.save()

						order_formset = OrderItemSet(inData)
						num_forms = int(inData['form-TOTAL_FORMS'])
						
						for i in range(0, num_forms):						
							prod_name = inData['form-' + str(i) + '-product_name']
							new_item_product = Product.objects.get(prod_name=prod_name)
							prod_quantity = int(inData['form-' + str(i) + '-quantity'])
							prod_notes = inData['form-' + str(i) + '-notes']
							
							new_item = OrderItem(order=newOrder, product=new_item_product, quantity=prod_quantity, item_notes=prod_notes)
							new_item.save()
							
							
						return HttpResponseRedirect('http://landmfg.com/portal/order_dash')


			# YesNoForm
			yesNoForm = YesNoForm()
			# Create Customer Form
			newCustomerForm = CustomerForm()
			# Create Order Information Form
			newOrderForm = OrderForm()
			# Create Items Formset
			newItemForm = OrderItemSet()

			context = {'customer_form' : newCustomerForm,
				   'order_form' : newOrderForm,
				   'item_set' : newItemForm,
				   'yes_no_form' : yesNoForm,
			           }

			return render(request, 'portal/create_order2.html', context)
		

### RETURNS a form of the requested order_id to edit order	
def edit_order(request, order_id):
	
	order_id = 'OR-' + str(order_id)
	
	if request.user.is_authenticated():
		
		if request.method == 'POST':
			
			inData = request.POST
			
			current_order = Order.objects.get(internalID=order_id)
			current_order_items = OrderItem.objects.filter(order=current_order)
			
			num_forms = int(inData['form-TOTAL_FORMS'])
					
			for item in current_order_items:
				item.delete()
						
			for i in range(0, num_forms):						
				prod_name = inData['form-' + str(i) + '-product_name']
				new_item_product = Product.objects.get(prod_name=prod_name)
				prod_quantity = int(inData['form-' + str(i) + '-quantity'])
				prod_notes = inData['form-' + str(i) + '-notes']
				
				new_item = OrderItem(order=current_order, product=new_item_product, quantity=prod_quantity, item_notes=prod_notes)
				new_item.save()
				
				
			
		
			return HttpResponseRedirect('http://landmfg.com/portal/home')	
		
		
		else:
			order = Order.objects.get(internalID=order_id)
			order_form = OrderModelForm(instance=order)
	
			orderitems = OrderItem.objects.filter(order=order)
	
			OrderItemFormset = formset_factory(OrderItemForm, BaseFormSet)
				
			count = 0
			formset_data = {'form-TOTAL_FORMS' : '1', 'form-INITIAL_FORMS' : '1', 'form-MAX_NUM_FORMS' : '', }
				
			for i in range(0, len(orderitems)):
				formset_data['form-' + str(i) + '-product_name'] = orderitems[i].product.prod_name
				formset_data['form-' + str(i) + '-quantity'] = orderitems[i].quantity
				formset_data['form-' + str(i) + '-notes'] = orderitems[i].item_notes
				count += 1
				formset_data['form-TOTAL_FORMS'] = str(count)
				
			item_set = OrderItemFormset(formset_data)
			
			context = {'order_form' : order_form, 'item_set' : item_set, } 
			
			return render(request, 'portal/edit_order.html', context)
		
		
def create_order_pause(request):
	OrderItemsSet = formset_factory(OrderItemForm, extra=0)

	if request.method == 'POST':
		formset = OrderItemsSet(request.POST)
		for form in formset.forms:
			if form.is_valid():
				print "You've picked {0}"
	else:
		formset = OrderItemsSet()
	return render(request, 'portal/create_order.html', {'formset' : formset})



########### PRODUCT CREATION AND EDIT VIEWS ###############
def generateID(prod_type):
	prefix = str(prod_type)[0:2]
	last_id = Product.objects.all().last()
	last_id = str(last_id.getID())
	return prefix + last_id

def create_product(request):

	if request.user.is_authenticated():

		if request.method == 'POST':
			inProductForm = ProductForm(request.POST)

			if inProductForm.is_valid():
				product_name = request.POST.get('prod_name', '')
				product_desc = request.POST.get('prod_desc', '')
				product_type = request.POST.get('prod_type', '')
				product_internalID = generateID(product_type)
				product_active = request.POST.get('prod_active', '')
				#product_flag = request.POST.get('prod_flag', '')
				product_price = request.POST.get('prod_price', '')
				if product_price == '':
					product_price = 0
					
				product_notes = request.POST.get('prod_notes', '')

				newProd = Product(prod_name=product_name, prod_desc=product_desc, prod_internalID=product_internalID,
						  prod_type=product_type, prod_active=product_active, prod_price=product_price,
						  prod_notes=product_notes)
				newProd.save()

				return HttpResponseRedirect('http://landmfg.com/portal/new_prod_success')


	newProductForm = ProductForm( {'prod_internalID' : 'This is a name'} )

	context = {'prod_form' : newProductForm, }

	return render(request, 'portal/create_product.html', context)


def new_prod_success(request):
	return render(request, 'portal/new_prod_success.html', {})






def create_order(request):
	user = request.user

	LinkFormSet = formset_factory(LinkForm, formset=BaseLinkFormSet)

	employee = Employee.objects.get(emp_user = user)
	shift_list = Shift.objects.filter(emp_id = employee)

	link_data = [{'shift_in' : shift.shift_in, 'shift_out' : shift.shift_out}
			for shift in shift_list]

	if request.method == 'POST':
		profile_form = ProfileForm(request.POST, user=user)
		link_formset = LinkFormSet(request.POST)

		new_shifts = []


		for link_form in link_formset:
			if link_form.is_valid():
				shift_in = link_form.cleaned_data.get('shift_in')
				shift_out = link_form.cleaned_data.get('shift_out')
				new_shift = Shift(shift_in=shift_in, shift_out=shift_out,emp_id=employee)

				new_shift.save()
	else:
		profile_form = ProfileForm(user=user)
		link_formset = LinkFormSet(initial=link_data)


	context = {
		'profile_form' : profile_form,
		'link_formset' : link_formset,
	}

	return render(request, 'portal/create_order.html', context)





################### PARTS AND PRODUCTION #####################
		

def create_part(request):
	
	if request.user.is_authenticated():	
		employee = Employee.objects.get(emp_user=request.user)
		
		if employee.emp_level == 'office':
			
			if request.method == 'POST':
				
				inData = request.POST
				part_supplier = Supplier.objects.get(name=inData['supplier'])
					
				new_part = Part(name = inData['name'], desc = inData['desc'], type = inData['part_type'],
								supplier = part_supplier, supplier_part_id = inData['supplier_part_id'],
								internal_part_id = inData['internal_part_id'], sell_price = 0.0,
								quantity = inData['quantity'], notes = inData['part_notes'],
							   ) 
				new_part.save()
				
				return HttpResponseRedirect("http://landmfg.com/portal/home")
			
				
			
			else:
			
				partForm = PartForm()
				
				context = { 'part_form' : partForm }
				return render(request, 'portal/create_part.html', context)


def create_production(request):
	
	if request.user.is_authenticated():
		
		if request.method == 'POST':
			return HttpResponse('hi there')
		
		else:
			pick_part = PickPartForm()
			
			context = { 'pick_part' : pick_part, }
			
			return render(request, 'portal/create_production.html', context)
		
		
			






