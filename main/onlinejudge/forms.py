from django import forms
from onlinejudge.models import *


class SubmitForm(forms.Form):
    source = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control', 'cols': '60',
                                                          'rows': '18', 'style': 'display:none', }),)


class UserForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Username'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password'}))


class RegisterForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Username'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password'}))
    password_check = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Type Password Again'}))
    department = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Department/School'}))


class ProblemForm(forms.Form):
    title = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', }))
    memory_limit = forms.IntegerField()
    time_limit = forms.IntegerField()
    description = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control', 'style': 'display:none', }))
    pre_written_code = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control', 'style': 'display:none', }))
    test_data = forms.FileField()


class ResetPasswordForm(forms.Form):
    old_password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Your Old Password'}))
    new_password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Your New Password'}))
    new_password_check = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Retype Your New Password'}))


