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
	url(r'^employee_dash/(?P<emp_id>[0-9]+)/(?P<week_start>\w+)/$', views.employee_dash, name='employee_dash'),

	# Employee Login
	url(r'^login_employee/$', views.login_employee, name='login_employee'),
	# Employee Logout
	url(r'^logout_employee/$', views.logout_employee, name='logout_employee'),

	url(r'^employee_summary/(?P<week_start>\w+)/$', views.employee_summary_week, name='employee_summary_week'),

    ################ ORDER URLS #################    

	# Order Dashboard
	url(r'^order_dash/$', views.order_dash, name='order_dash'),
    
    # Order Detail
    url(r'^order_detail/(?P<order_id>[O][R][-][0-9]+)/$', views.order_detail, name='order_detail'),
    
	# Order Entry
	url(r'^create_new_order/$', views.create_new_order, name='create_order'),

    # Edit Order
    url(r'^edit_order/(?P<order_id>[0-9]+)/$', views.edit_order, name='edit_order'),



	# Product Entry
	url(r'^create_product/$', views.create_product, name='create_product'),
    url(r'^new_prod_success/$', views.new_prod_success, name='new_prod_success'),


    


    #Things we need
    url(r'^add_thing/$', views.add_thing, name='add_thing'),
    url(r'^view_things/$', views.view_things, name='view_things'),
    url(r'^delete_thing/(?P<thing_id>[0-9]+)/$', views.delete_thing, name='delete_thing'),


    #### PRODUCTION AND PARTS
    # Part Entry
    url(r'^create_part/$', views.create_part, name='create_part'),
    url(r'^create_production/$', views.create_production, name='create_production'),


]



