from django.conf.urls import patterns, include, url
from django.conf import settings
from onlinejudge.views import *
from blog.views import *
from django.contrib import admin
from onlinejudge.views import oj_homepage

admin.autodiscover()

urlpatterns = patterns(
    '',
    url(r'^django_admin/', include(admin.site.urls)),

    (r'^$', oj_homepage),
    (r'^announcement$', blog_list),
    (r'^blog/([0-9]*)$', blog_fulltext),
    (r'^problem$', oj_problem_list),
    (r'^problem/show/([0-9]*)$', oj_problem_view),
    (r'^problem/submit/([0-9]*)$', oj_submit),
    (r'^status$', oj_status_view),
    (r'^status/([0-9]*)$', oj_status_detail),

    (r'^admin$', oj_admin_main),
    (r'^admin/problem$', oj_admin_problem),
    (r'^admin/problem/new$', oj_admin_add_problem),
    (r'^admin/problem/modify/([0-9]*)$', oj_admin_modify_problem),
    (r'^admin/user$', oj_admin_user),
    (r'^admin/user/reset/([0-9]*)$', password_reset),

    (r'^admin/blog$', oj_admin_bloglist),
    (r'^admin/blog/modify/([0-9]*)$', blog_modify),
    (r'^admin/blog/remove/([0-9]*)$', blog_remove),
    (r'^admin/blog/new$', blog_add),

    (r'^login$', oj_login),
    (r'^logout$', oj_logout),
    (r'^register$', oj_register),
    (r'^rank$', oj_rank),

    (r'^reset$', oj_reset),

    (r'^userinfo$', oj_userinfo),
    (r'^userinfo/([0-9]*)$', oj_userinfo_explict),

    (r'^static/(?P<path>.*)$','django.views.static.serve', { 'document_root':settings.STATIC_ROOT }),
)
