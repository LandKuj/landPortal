from django.conf.urls import url

from . import views

urlpatterns = [

	# index and home page
	url(r'^$', views.index, name='index'),
	url(r'^home/$', views.home, name='home'),
	url(r'^logout_page/$', views.logout_page, name='logout_page'),

	# not allowed page
	url(r'^not_allowed/$', views.not_allowed, name='not_allowed'),



	# Employee directions page
	url(r'^employee_dashboard/$', views.employee_dashboard, name='employee_dashboard'),
	# edited employee dash
	url(r'^employee_dash/(?P<emp_id>[0-9]+)/$', views.employee_dash, name='employee_dash'),

	# Employee Login
	url(r'^login_employee/$', views.login_employee, name='login_employee'),
	# Employee Logout
	url(r'^logout_employee/$', views.logout_employee, name='logout_employee'),

	# Employee Summary
	url(r'^employee_summary/$', views.employee_summary, name='employee_summary'),

	url(r'^employee_summary/(?P<week_start>\w+)/$', views.employee_summary_week, name='employee_summary_week'),


	# Order Entry
	url(r'^create_order/$', views.create_order, name='create_order'),


]



