from django import forms
from django.forms import PasswordInput, formset_factory, ModelForm
from django.forms.formsets import BaseFormSet
from portal.models import *
# This is a comment left from komodo

class SiteLoginForm(forms.Form):
	username = forms.CharField(required=True)
	password = forms.CharField(required=True, widget=PasswordInput())


class YesNoForm(forms.Form):
	create_customer = forms.NullBooleanField(required=False)
	
#class PickPartForm(forms.Form):
#	part_choices = [ (part.name, part.name) for part in Part.objects.all() ]
#	part = forms.ChoiceField(choices=part_choices)

class ThingForm(forms.Form):
	name = forms.CharField(required=True)
	desc = forms.CharField(required=True)


class CustomerForm(forms.Form):
	name = forms.CharField(required=False)
	address = forms.CharField(required=False)
	city = forms.CharField(required=False)
	state = forms.CharField(required=False)
	zip = forms.CharField(required=False)
	phone = forms.CharField(required=False)
	email = forms.CharField(required=False)


class StatusForm(forms.Form):
	status_choices = (
        ('Placed', 'Placed'),
        ('Production', 'Production'),
		('Paint', 'Paint'),
		('Finishing', 'Finishing'),
        ('Completed', 'Completed'),
		('Shipped', 'Shipped'),
        )
	status = forms.ChoiceField(choices=status_choices, required=False)
	
	
		

class OrderForm(forms.Form):
	customer = forms.CharField(required=False)
	exp_date = forms.DateField(required=False)
	order_type = forms.CharField(required=False)
	ship_method = forms.CharField(required=False)
	payment_terms = forms.CharField(required=False)
	priority = forms.CharField(required=False)
	order_notes = forms.CharField(required=False)

class OrderModelForm(ModelForm):
	class Meta:
		model = Order
		fields = ['cust_id', 'internalID', 'order_date', 'exp_order_date', 'order_type', 'ship_method', 'payment_terms',
				  'priority', 'status', 'order_flag', 'order_flag2', 'order_notes']



class OrderItemForm(forms.Form):
	product_list_choices = [ (prod.prod_name, prod.prod_name) for prod in Product.objects.all()]
	product_name = forms.ChoiceField(choices=product_list_choices, required=True)
	quantity = forms.IntegerField(widget=forms.NumberInput(), required=True)
	notes = forms.CharField(widget=forms.Textarea(attrs={'rows' : 3, 'cols' : 12,}), required=False)


class OpenOrderItemForm(forms.Form):
	product_name = forms.CharField(required=False)
	quantity = forms.IntegerField(required=True, widget=forms.NumberInput())
	notes = forms.CharField(required=False, widget=forms.Textarea(attrs={'rows' : 3, 'cols' : 18,}))




class PartForm(forms.Form):
	name = forms.CharField(max_length=150)
	desc = forms.CharField(max_length=200, required=False)
	# Should be created dynamically
#	type_choices = 	(
#		('Steel - Raw', 'Steel - Raw'),
#		('Steel - Cut', 'Steel - Cut'),
#		('Bolts/Nuts/Washers', 'Bolts/Nuts/Washers'),
 #       ('Manufactured - Input', 'Manufactured - Input'),
#		)
#	part_type = forms.ChoiceField(choices=type_choices, required=False)
#	supplier_choice = [(supply.name, supply.name) for supply in Supplier.objects.all()]
#	supplier = forms.ChoiceField(choices=supplier_choice, required=False)
#	supplier_part_id = forms.CharField(max_length=50, required=False)
	internal_part_id = forms.CharField(max_length=50, required=False)
	sell_price = forms.DecimalField(required=False)
	quantity = forms.IntegerField(required=False)
	part_notes = forms.CharField(required=False)
	
class CreateProdForm(forms.Form):
	create_prod = forms.BooleanField(required=False)
	
	
#class ProdPart(forms.Form):
#	part_types = ( (part.type, part.type) for part in Part.objects.all()  )
#	prod_part_type = forms.ChoiceField(choices=part_types, required=False)
#	part_choices = ( (part.name, part.name) for part in Part.objects.all() )
#	prod_part_quantity = forms.IntegerField(required=False)
	


class MyForm(forms.Form):
    original_field = forms.CharField()
    extra_field_count = forms.CharField(widget=forms.HiddenInput())

    def __init__(self, *args, **kwargs):
        extra_fields = kwargs.pop('extra', 0)

        super(MyForm, self).__init__(*args, **kwargs)
        self.fields['extra_field_count'].initial = extra_fields

        for index in range(int(extra_fields)):
            # generate extra fields in the number specified via extra_fields
            self.fields['extra_field_{index}'.format(index=index)] = \
                forms.CharField()



class LinkForm(forms.Form):

	shift_in = forms.CharField(max_length=100,
				 widget=forms.TextInput(attrs={
				'placeholder': 'in', }), required=False)

	shift_out = forms.CharField( widget=forms.TextInput(attrs={'placeholder' : 'out', }), required=False)



class ProfileForm(forms.Form):

	def __init__(self, *args, **kwargs):
		self.user = kwargs.pop('user', None)
		super(ProfileForm, self).__init__(*args, **kwargs)

		self.fields['full_name'] = forms.CharField(
					max_length=30, 
					initial='first name', widget=forms.TextInput(attrs={'placeholder' : 'First Name',
					}))


class ProductForm(forms.Form):

	prod_name = forms.CharField(required=True, max_length=100,
					widget=forms.TextInput(attrs={
					'placeholder' : 'Product Name', }))

	prod_desc = forms.CharField(required=False, widget=forms.Textarea())
	
	prod_type_choices = (
                                ('Regular Tow-Dolly', 'Regular Tow-Dolly'),
                                ('Motorcycle Tow-Dolly', 'Motorcycle Tow-Dolly'),
                                ('Accessory', 'Accessory'),
                                ('Brakes', 'Brakes'),
								('Add-On', 'Add-On'),
								('Custom Work', 'Custom Work'),
        )

	prod_type = forms.ChoiceField(choices=prod_type_choices, required=True)

	prod_active = forms.NullBooleanField(required=True, widget=forms.NullBooleanSelect())

	prod_price = forms.FloatField(required=False, widget=forms.NumberInput())

	prod_notes = forms.CharField(required=False, widget=forms.Textarea())


class BaseOrderItemSet(BaseFormSet):
	def clean(self):
		
		for form in self.forms:
			if form.cleaned_data:
				product_name = form.cleaned_data['product_name']
				quantity = form.cleaned_data['quantity']
				notes = form.cleaned_data['notes']
				


class BaseLinkFormSet(BaseFormSet):
    def clean(self):
        if any(self.errors):
            return

        shift_ins = []
        shift_outs = []
        duplicates = False

        for form in self.forms:
            if form.cleaned_data:
                shift_in = form.cleaned_data['shift_in']
                shift_out = form.cleaned_data['shift_out']

                # Check that no two links have the same anchor or URL
                if shift_in and shift_out:
                    if shift_in in shift_ins:
                        duplicates = True
                    shift_ins.append(shift_in)

                    if shift_out in shift_outs:
                        duplicates = True
                    shift_outs.append(shift_out)

                if duplicates:
                    raise forms.ValidationError(
                        'Links must have unique anchors and URLs.',
                        code='duplicate_links'
                    )

                # Check that all links have both an anchor and URL
                if shift_in and not shift_out:
                    raise forms.ValidationError(
                        'All links must have an anchor.',
                        code='missing_anchor'
                    )
                elif shift_out and not shift_in:
                    raise forms.ValidationError(
                        'All links must have a URL.',
                        code='missing_URL'
                    )
