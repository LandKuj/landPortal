from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from django.shortcuts import render, render_to_response, redirect

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

from django.forms.formsets import formset_factory
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.db import IntegrityError, transaction


import datetime
import os

from portal.models import *
from .forms import SiteLoginForm, OrderItemForm, MyForm, LinkForm, BaseLinkFormSet, ProfileForm

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




def home(request):
	if not(request.user.is_authenticated()):
		return HttpResponseRedirect('/portal/not_allowed')
	else:
		employee = Employee.objects.get(emp_user=request.user)
		if employee.emp_level == 'employee':
			return HttpResponseRedirect('/portal/employee_dash/' + str(employee.id))

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





def employee_dash(request, emp_id):

	if request.user.is_authenticated():

		employee_visit = Employee.objects.get(emp_user = request.user)
		employee_dash = Employee.objects.get(id = emp_id)

		# Should be office, returns the page for the requested employee
		if employee_visit.emp_level == 'employee' or 'office':
			employee_name = employee_dash.emp_name
			loggedIn = employee_dash.isClockedIn()

			hold_friday = datetime.date(2016, 5, 27)

	                os.environ['TZ'] = 'US/Central'


                	today_date = datetime.date.today()
                	date_dif = today_date - hold_friday

                	days_back = date_dif.days % 7

                	week_begin = today_date - datetime.timedelta(days=days_back)
                	week_end = today_date - datetime.timedelta(days=days_back) + datetime.timedelta(days=7)

			employee_shifts = Shift.objects.filter(emp_id = employee_dash)
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




def employee_summary(request):

		if request.user.is_authenticated():
			employee = Employee.objects.get(emp_user = request.user)

			if employee.emp_level == 'office':
				hold_friday = datetime.date(2016, 5, 27)

                        	os.environ['TZ'] = 'US/Central'


	                        today_date = datetime.date.today()
        	                date_dif = today_date - hold_friday

                	        days_back = date_dif.days % 7

                        	week_begin = today_date - datetime.timedelta(days=days_back)
                        	week_end = today_date - datetime.timedelta(days=days_back) + datetime.timedelta(days=7)

				shifts_this_week = Shift.objects.filter(shift_in__range=(week_begin, week_end))

				employees = Employee.objects.all()
				employee_names = []
				employee_work_time = []
				for emp in employees:
					employee_names.append(emp.emp_name)
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

					employee_work_time.append(sum(temp_time))
					temp_time = []


				return render(request, 'portal/emp_summary.html', {'employee_names' : employee_names, 'employee_work_time' : employee_work_time,
										 'today_date' : today_date, } )
		else:

			return HttpResponseRedirect('/portal/not_allowed')


def employee_summary_week(request, week_start):

        if request.user.is_authenticated():
                employee = Employee.objects.get(emp_user = request.user)

                # Should be office, returns the page for the requested employee
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

                         employees = Employee.objects.all()
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
				employee_id.append("http://landmfg.com/portal/employee_dash/" + str(emp.id))
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
			return HttpResponseRedirect( ('/portal/employee_dash/' + str(employee.id)) )

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






def create_order(request):
    if request.method == 'POST':
        form = MyForm(request.POST, extra=request.POST.get('extra_field_count'))
        if form.is_valid():
            print "valid!"
    else:
        form = MyForm()
    return render(request, 'portal/create_order.html', { 'form': form })
