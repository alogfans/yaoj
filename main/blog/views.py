from django.template import loader, Context
from django.http import HttpResponse, Http404, HttpResponseRedirect
from blog.models import BlogPost
from blog.forms import BlogPostForm
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
import markdown

def blog_list(request):
    posts = BlogPost.objects.all().order_by('-created_time')    
    return render_to_response('main/blog_list.html', 
        {'posts': posts, 'username': request.COOKIES.get('username')}, )

def blog_fulltext(request, pid):
    if BlogPost.objects.filter(id=pid).count() is not 1:
        raise Http404
    post = BlogPost.objects.get(id=pid)
    build_page = markdown.markdown(post.body)
    t = loader.get_template("main/blog.html")
    c = Context({'post': post, 'build_page': build_page})
    return HttpResponse(t.render(c))


@csrf_exempt
def blog_add(request):
    if request.method == 'POST':
        form = BlogPostForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data

            post = BlogPost()
            post.title = cd['title']
            post.author = cd['author']
            post.abstract = cd['abstract']
            post.body = cd['body_md']
            post.created_time = datetime.now()
            post.modified_time = datetime.now()
            post.save()
            return HttpResponseRedirect('/admin/blog')
    else:
        form = BlogPostForm()
    return render_to_response('admin/blog_modify.html', {'form': form})


def blog_remove(request, pid):
    if BlogPost.objects.filter(id=pid).count() is not 1:
        raise Http404
    post = BlogPost.objects.get(id=pid)
    post.delete()
    return HttpResponseRedirect('/admin/blog')


@csrf_exempt
def blog_modify(request, pid):
    if BlogPost.objects.filter(id=pid).count() is not 1:
        raise Http404
    post = BlogPost.objects.get(id=pid)

    if request.method == 'POST':
        form = BlogPostForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            post.title = cd['title']
            post.author = cd['author']
            post.abstract = cd['abstract']
            post.body = cd['body_md']
            post.modified_time = datetime.now()
            post.save()
            return HttpResponseRedirect('/admin/blog')
    else:
        form = BlogPostForm(initial={'title': post.title, 'author': post.author,
                                     'abstract': post.abstract, 'body_md': post.body},)
    return render_to_response('admin/blog_modify.html', {'form': form})
