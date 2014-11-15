from django.shortcuts import render_to_response, render
from onlinejudge.models import *
from blog.models import *
from django.http import HttpResponse, Http404, HttpResponseRedirect
from onlinejudge.forms import *
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
from markdown import markdown
import hashlib
import psutil
import MySQLdb

def oj_homepage(request):
    posts = BlogPost.objects.all().order_by('-created_time')
    return render_to_response('main/home.html',
                              {'username': request.COOKIES.get('username'), 'posts': posts}, )


def oj_problem_list(request):
    problems = Problem.objects.raw("SELECT * FROM view_problem_ex")
    accepted = [0,]
    if request.COOKIES.get('username'):
        user = User.objects.get(username = request.COOKIES.get('username'))
        conn = MySQLdb.connect(host="localhost", user="root", passwd="p@ssw0rd", db="onlinejudge", charset="utf8")  
        cursor = conn.cursor()
        n = cursor.execute("select distinct commit_problem_id from onlinejudge_record where commit_status_id = 2 and commit_user_id = %s", user.id)
        
        for row in cursor.fetchall():    
            for r in row:    
                accepted.append(int(r)) 
        conn.close()
    return render_to_response('main/problem.html',
            {'username': request.COOKIES.get('username'), 'problems': problems, 'accepted': accepted})


def oj_problem_view(request, pid):
    if Problem.objects.filter(id=pid).count() is not 1:
        raise Http404

    problem = Problem.objects.get(id=pid)
    current_user = request.COOKIES.get('username', '')
    if request.method == 'POST':
        form = SubmitForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            # post operation
            submission = Record(commit_user=User.objects.get(username=request.COOKIES.get('username', '')),
                                commit_problem=Problem.objects.get(id=pid),
                                commit_status=Response.objects.get(short_string='WAIT_FOR_JUDGE'),
                                commit_date=datetime.now(),
                                commit_sourcefile=cd['source'],
                                commit_external="N/A",
                                cost_time_ms=-1,
                                cost_memory_mb=-1)
            submission.save()
            return HttpResponseRedirect('/status')
    else:
        form = SubmitForm()
    return render_to_response('main/detail.html', {'username': request.COOKIES.get('username'),
                                                   'problem': problem,
                                                   'form': form,
                                                   'description': markdown(problem.description)})

def oj_status_view(request):
    status = Record.objects.all().order_by('-id')
    return render_to_response('main/status.html',
                              {'username': request.COOKIES.get('username'), 'status': status})


def oj_status_detail(request, rid):
    if Record.objects.filter(id=rid).count() is not 1:
        raise Http404
    statu = Record.objects.get(id=rid)
    return render_to_response('main/status_detail.html',
                              {'username': request.COOKIES.get('username'), 'statu': statu})

@csrf_exempt
def oj_submit(request, pid):
    if Problem.objects.filter(id=pid).count() is not 1:
        raise Http404

    problem = Problem.objects.get(id=pid)
    current_user = request.COOKIES.get('username', '')
    if not current_user:
        return HttpResponseRedirect('/problem')
    if request.method == 'POST':
        form = SubmitForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            # post operation
            submission = Record(commit_user=User.objects.get(username=request.COOKIES.get('username', '')),
                                commit_problem=Problem.objects.get(id=pid),
                                commit_status=Response.objects.get(short_string='WAIT_FOR_JUDGE'),
                                commit_date=datetime.now(),
                                commit_sourcefile=cd['source'],
                                commit_external="N/A",
                                cost_time_ms=-1,
                                cost_memory_mb=-1)
            submission.save()
            return HttpResponseRedirect('/status')
    else:
        form = SubmitForm()
    return render_to_response('main/submit.html', {'username': request.COOKIES.get('username'),
                                                   'problem': problem,
                                                   'form': form})


def oj_admin_main(request):
    if cmp(request.COOKIES.get('username'),'Admin') != 0:
        return render_to_response('admin/forbidden.html', {'username': request.COOKIES.get('username'), })

    info =  "Server Time  : " + str(datetime.now()) + "\n"
    info += "CPU (%)      : " + str(psutil.cpu_percent()) + "\n"
    info += "Memory (%)   : " + str(psutil.virtual_memory().percent);
    exist = 0
    for pid in psutil.pids():
        proc = psutil.Process(pid)
        if cmp(proc.name(), 'Judger') is 0:
            exist = 1
            info += "\nJudge process work properly."
    if exist is 0:
        info += "\nWarning: Judge process may not work properly."
    return render_to_response('admin/server.html', {'username': request.COOKIES.get('username'), 'info': info})



@csrf_exempt
def oj_login(request):
    if request.COOKIES.get('username'):
        return HttpResponseRedirect('/')

    if request.method == 'POST':
        uf = UserForm(request.POST)
        if uf.is_valid():
            username = uf.cleaned_data['username']
            password = uf.cleaned_data['password']
            try:
                hash_username = hashlib.md5(username).hexdigest().upper()
                hash_password = hashlib.md5(password).hexdigest().upper()
                user = User.objects.get(username__exact=username, password__exact=hash_password)
                response = HttpResponseRedirect('/')
                response.set_cookie('username', username, 3600)
                user.last_activity_date = datetime.now()
                user.save()
            except:
                return render_to_response('session/login.html', {'uf': uf, 'invalid': 1})
            return response
    else:
        uf = UserForm()
    return render_to_response('session/login.html', {'uf': uf})


def oj_logout(request):
    response = HttpResponseRedirect('/')
    response.delete_cookie('username')
    return response


@csrf_exempt
def oj_register(request):
    if request.COOKIES.get('username'):
        return HttpResponseRedirect('/')

    if request.method == 'POST':
        uf = RegisterForm(request.POST)

        if uf.is_valid():
            ufc = uf.cleaned_data
            if cmp(ufc['password'], ufc['password_check']):
                return render_to_response('session/register.html', {'uf': uf, 'invalid': 1})

            new_user = User(username=ufc['username'], password=hashlib.md5(ufc['password']).hexdigest().upper(),
                            department=ufc['department'], register_date=datetime.now(),
                            last_activity_date=datetime.now())
            new_user.save()
            response = HttpResponseRedirect('/login')
            return response
        else:
            response = HttpResponseRedirect('/register')
            return response
    else:
        uf = RegisterForm()
    return render_to_response('session/register.html', {'uf': uf})


def oj_userinfo(request):
    current_user = request.COOKIES.get('username', '')
    user_info = User.objects.get(username=current_user)
    rank = User.objects.raw("SELECT * FROM view_user_ex")
    problems = Problem.objects.raw("SELECT * FROM view_problem_ex")
    accepted = []
    conn = MySQLdb.connect(host="localhost", user="root", passwd="p@ssw0rd", db="onlinejudge", charset="utf8")  
    cursor = conn.cursor()
    n = cursor.execute("select distinct commit_problem_id from onlinejudge_record where commit_status_id = 2 and commit_user_id = %s", user_info.id)
    
    for row in cursor.fetchall():    
        for r in row:    
            accepted.append(int(r)) 
    conn.close()
    return render_to_response('session/userinfo.html',
                              {'username': current_user, 'users': user_info, 'accepted': accepted, 'rank': rank})


def oj_userinfo_explict(request, uid):
    if User.objects.filter(id=uid).count() != 1:
        return Http404
    user_info = User.objects.get(id=uid)
    rank = User.objects.raw("SELECT * FROM view_user_ex")
    accepted = []
    conn = MySQLdb.connect(host="localhost", user="root", passwd="p@ssw0rd", db="onlinejudge", charset="utf8")  
    cursor = conn.cursor()
    n = cursor.execute("select distinct commit_problem_id from onlinejudge_record where commit_status_id = 2 and commit_user_id = %s", user_info.id)
    
    for row in cursor.fetchall():    
        for r in row:    
            accepted.append(int(r)) 
    conn.close()   
    return render_to_response('session/userinfo.html',
                              {'username': request.COOKIES.get('username'), 'users': user_info, 'accepted': accepted, 'rank': rank})


def oj_rank(request):
    rank = User.objects.raw("SELECT * FROM view_user_ex order by su_count DESC")
    return render_to_response('main/rank.html',
                              {'username': request.COOKIES.get('username'), 'rank': rank})

@csrf_exempt
def oj_admin_add_problem(request):
    if request.method == 'POST':
        form = ProblemForm(request.POST,request.FILES)
        if form.is_valid():
            cd = form.cleaned_data
            # post operation
            new_problem = Problem(title=cd['title'],
                                  post_date=datetime.now(),
                                  memory_limit=cd['memory_limit'],
                                  time_limit=cd['time_limit'],
                                  description=cd['description'],
                                  pre_written_code=cd['pre_written_code'],
                                  test_data=cd['test_data'],)
            new_problem.save()
            return HttpResponseRedirect('/problem')
    else:
        form = ProblemForm()
    return render_to_response('admin/modify_problem.html', {'username': request.COOKIES.get('username'), 'form': form})


@csrf_exempt
def oj_admin_modify_problem(request, pid):
    if Problem.objects.filter(id=pid).count() is not 1:
        raise Http404
    problem = Problem.objects.get(id=pid)

    if request.method == 'POST':
        form = ProblemForm(request.POST,request.FILES)
        if form.is_valid():
            cd = form.cleaned_data
            # post operation
            problem.title=cd['title']
            problem.memory_limit=cd['memory_limit']
            problem.time_limit=cd['time_limit']
            problem.description=cd['description']
            problem.test_data=cd['test_data']
            problem.pre_written_code=cd['pre_written_code']
            problem.save()
            for rec in Record.objects.filter(commit_problem = problem):
                rec.commit_status = Response.objects.get(id=1)
                rec.save()
            return HttpResponseRedirect('/problem')
    else:
        form = ProblemForm(initial={'title': problem.title, 'memory_limit': problem.memory_limit,
                                    'time_limit': problem.time_limit, 'description': problem.description,
                                    'test_data': problem.test_data, 'pre_written_code': problem.pre_written_code},)
    return render_to_response('admin/modify_problem.html', {'username': request.COOKIES.get('username'), 'form': form})





def oj_admin_user(request):
    users = User.objects.all()
    return render_to_response('admin/user.html', {'username': request.COOKIES.get('username'), 'users': users})


def oj_admin_bloglist(request):
    posts = BlogPost.objects.all().order_by('-created_time')
    return render_to_response('admin/blog_list.html', {'username': request.COOKIES.get('username'), 'posts': posts})


def password_reset(request, uid):
    if User.objects.filter(id=uid).count() != 1:
        return Http404
    user_info = User.objects.get(id=uid)
    list = 'abcdefghijklmnopqrstuvwxyz$&()#@'
    import string, random
    password = string.join(random.sample(list, 8), sep='')
    user_info.password = hashlib.md5(password).hexdigest().upper()
    user_info.save()

    users = User.objects.all()
    return render_to_response('admin/user.html', 
        {'username': request.COOKIES.get('username'), 'users': users, 
        'info': 'Password of user <strong>' + user_info.username + '</strong> has been reset to <strong>' + password + '</strong>.'})



def oj_admin_problem(request):
    problems = Problem.objects.all()
    return render_to_response('admin/problem.html', {'username': request.COOKIES.get('username'), 'problems': problems})


@csrf_exempt
def oj_reset(request):
    username = request.COOKIES.get('username')

    if request.method == 'POST':
        uf = ResetPasswordForm(request.POST)

        if uf.is_valid():
            ufc = uf.cleaned_data
            if ufc['new_password'] != ufc['new_password_check']:
                response = HttpResponseRedirect('/reset')
                return response
            if User.objects.filter(username=username).count() is not 1:
                response = HttpResponseRedirect('/')
                return response
            userinfo = User.objects.get(username=username)

            if hashlib.md5(ufc['old_password']).hexdigest().upper() != userinfo.password:
                response = HttpResponseRedirect('/reset')
                return response

            userinfo.password = hashlib.md5(ufc['new_password']).hexdigest().upper()
            userinfo.save()
            response = HttpResponseRedirect('/login')
            return response
        else:
            response = HttpResponseRedirect('/reset')
            return response
    else:
        uf = ResetPasswordForm()
    return render_to_response('session/reset.html', {'uf': uf, 'username': username})
