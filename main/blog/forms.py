from django import forms
from blog.models import *
import re

class BlogPostForm(forms.Form):
    title = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control', 'size': '60'}))
    author = forms.CharField(max_length=30, widget=forms.TextInput(attrs={'class': 'form-control', 'size': '30'}))

    abstract = forms.CharField(max_length=500,
                               widget=forms.Textarea(attrs={'class': 'form-control',
                                                            'cols': '60',
                                                            'rows': '5'}),
                               required=False)
    body_md = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control',
                                                           'cols': '60',
                                                           'rows': '18',
                                                           'style': 'display:none', }),)


