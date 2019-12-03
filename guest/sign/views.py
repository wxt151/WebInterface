"""
业务逻辑层，该层包含存取模型及调取恰当模板的相关逻辑，可以把它看作是模型与模板之间的桥梁
"""
from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from sign.models import Event,Guest
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger


# Create your views here.
def index(request):
    return render(request,"index.html")
    # return HttpResponse("Hello Django!")


def login_action(request):
    """ 登录动作 """
    if request.method == 'POST':
        username = request.POST.get('username','')
        password = request.POST.get('password','')
        # if username == 'admin' and password == 'admin123':
        # authenticate()认证用户名和密码正确的情况下返回一个 user 对象，否则返回None
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request,user)    # 登录
            """
            # 服务器响应头设置Cookie信息
            response = HttpResponseRedirect('/event_manage/')
            response.set_cookie('user', 'weixiantao', 3600)  # 添加浏览器cookie
            """
            request.session['user'] = username               # 将session信息记录到浏览器
            response = HttpResponseRedirect('/event_manage/')
            return response

        else:
            return render(request,'index.html',{'error':'username or password error!'})

@login_required
def event_manage(request):
    """
    发布会管理
    # 客户端浏览器请求头附上服务器返回的Cookie信息
    username = request.COOKIES.get('user','')    # 读取浏览器cookie
    """
    username = request.session.get('user','')      # 读取浏览器session
    # return render(request,"event_manage_git.html",{"user":username})

    event_list = Event.objects.all()
    return render(request,"event_manage_git.html",{"user":username,"events":event_list})



@login_required
def search_name(request):
    """ 发布会名称搜索 """
    username = request.session.get('user','')
    search_name = request.GET.get("name","")
    event_list = Event.objects.filter(name__contains=search_name)
    return render(request,"event_manage_git.html",{"user":username,"events":event_list})


@login_required
def guest_manage(request):
    """ 嘉宾管理 """
    username = request.session.get('user','')
    guest_list = Guest.objects.all()
    paginator = Paginator(guest_list, 2)
    page = request.GET.get('page')
    try:
        contacts = paginator.page(page)
    except PageNotAnInteger:
        # 如果 page 不是整数，取第一页面数据
        contacts = paginator.page(paginator.num_pages)
    except EmptyPage:
        # 如果page不在范围，取最后一页面
        contacts = paginator.page(paginator.num_pages)
    return render(request, "guest_manage.html", {"user": username, "guests": contacts})


@login_required
def search_phone(request):
    """ 嘉宾管理页面的搜索 """
    username = request.session.get('user','')
    search_phone = request.GET.get("phone","")
    guest_list = Guest.objects.filter(phone__contains=search_phone)
    return render(request,"guest_manage.html",{"user":username,"guests":guest_list})



@login_required
def sign_index(request,eid):
    """ 签到页面 """
    event = get_object_or_404(Event,id=eid)
    return render(request,'sign_index.html',{'event':event})

@login_required
def sign_index_action(request,eid):
    """  签到动作 """
    event = get_object_or_404(Event,id=eid)
    phone = request.POST.get('phone','')
    print(phone)

    result = Guest.objects.filter(phone=phone)
    if not result:
        return render(request,'sign_index.html',{'event':event,'hint':'phone error'})

    result = Guest.objects.filter(phone=phone,event_id=eid)
    if not result:
        return render(request,'sign_index.html',{'event':event,'hint':'event id or phone error.'})

    result = Guest.objects.get(phone=phone, event_id=eid)
    if result.sign:
        return render(request, 'sign_index.html', {'event': event, 'hint': 'user has sign in.'})
    else:
        Guest.objects.filter(phone=phone,event_id=eid).update(sign='1')
        return render(request, 'sign_index.html', {'event': event, 'hint': 'sign in success!.','guest':result})



@login_required
def logout(request):
    """ 退出登录 """
    auth.logout(request)   # 退出登录
    response = HttpResponseRedirect('/index/')
    return response