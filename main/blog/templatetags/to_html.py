import markdown, datetime
from django import template 
from django.template.base import (Node, NodeList, TemplateSyntaxError) 
register = template.Library() 
 
@register.filter(name='toHtml') 
def toHtml(markdownfile):     
    return markdown.markdown(markdownfile)

@register.filter(name='toNowTime') 
def toNowTime(black_hole):     
    return datetime.now()

