# -*- coding: utf-8 -*-

from django.contrib import admin
from onlinejudge.models import *


admin.site.register(Problem)
admin.site.register(User)
admin.site.register(Record)
admin.site.register(Response)