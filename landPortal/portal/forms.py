from django import forms
from django.forms import PasswordInput, formset_factory
from django.forms.formsets import BaseFormSet

class SiteLoginForm(forms.Form):
	username = forms.CharField(required=True)
	password = forms.CharField(required=True, widget=PasswordInput())


class OrderForm(forms.Form):
	customer = forms.CharField(required=False)
	exp_date = forms.DateField(required=False)
	order_type = forms.CharField(required=False)
	ship_method = forms.CharField(required=False)
	payment_terms = forms.CharField(required=False)
	priority = forms.CharField(required=False)
	order_notes = forms.CharField(required=False)

	def __init__(self, *args, **kwargs):
		super(OrderForm, slef).__init__(*args, **kwargs)

		self.fields['customer'] = forms.Charfield(max_length=30)


class OrderItems(forms.Form):
	product = forms.CharField(max_length=200, widget=forms.TextInput(attrs={'placeholder' : 'product',}), required=False)
	price = forms.CharField(max_length=200, widget=forms.TextInput(attrs={'placeholder' : 'price',}), required=False)
	notes = forms.CharField(max_length=1000, widget=forms.TextInput(attrs={'placeholder' : 'notes',}), required=False)
	extra_field_count = forms.CharField(widget=forms.HiddenInput())

	def __init__(self, *args, **kwargs):
		extra_fields = kwargs.pop('extra', 0)

		super(OrderItems, self).__init__(*args, **kwargs)
		self.fields['extra_field_count'].initial = extra_fields

		for index in range(int(extra_fields)):
			self.fields['extra_field_{index}'.format(index=index)] = forms.CharField()




class OrderItemForm(forms.Form):
	item_name = forms.ChoiceField(choices=(('blue', 'Blue'), ('red', 'Red')))



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

	anchor = forms.CharField(max_length=100,
				 widget=forms.TextInput(attrs={
				'placeholder': 'Link Name / Anchor Text', }), required=False)

	url = forms.URLField( widget=forms.URLInput(attrs={'placeholder' : 'URL', }), required=False)



class ProfileForm(forms.Form):

	def __init__(self, *args, **kwargs):
		self.user = kwargs.pop('user', None)
		super(ProfileForm, self).__init__(*args, **kwargs)

		self.fields['first_name'] = forms.CharField(
					max_length=30, 
					initial='first name', widget=forms.TextInput(attrs={'placeholder' : 'First Name',
					}))
		self.fields['last_name'] = forms.CharField(
					max_length=30,
					initial='last name', widget=forms.TextInput(attr={'placeholder' : 'Last Name',
					}))



class BaseLinkFormSet(BaseFormSet):
    def clean(self):
        if any(self.errors):
            return

        anchors = []
        urls = []
        duplicates = False

        for form in self.forms:
            if form.cleaned_data:
                anchor = form.cleaned_data['anchor']
                url = form.cleaned_data['url']

                # Check that no two links have the same anchor or URL
                if anchor and url:
                    if anchor in anchors:
                        duplicates = True
                    anchors.append(anchor)

                    if url in urls:
                        duplicates = True
                    urls.append(url)

                if duplicates:
                    raise forms.ValidationError(
                        'Links must have unique anchors and URLs.',
                        code='duplicate_links'
                    )

                # Check that all links have both an anchor and URL
                if url and not anchor:
                    raise forms.ValidationError(
                        'All links must have an anchor.',
                        code='missing_anchor'
                    )
                elif anchor and not url:
                    raise forms.ValidationError(
                        'All links must have a URL.',
                        code='missing_URL'
                    )
