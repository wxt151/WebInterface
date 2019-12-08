"""guest URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
# from django.urls import path   无法使用正则，有报错,Django1的用法
from  django.conf.urls import url,include
from sign import views # 导入sign应用views文件

urlpatterns = [
    url(r'admin/', admin.site.urls),
    url(r'^index/$',views.index),                # 添加index/路径配置
    url(r'^login_action/$',views.login_action),  # 添加 login_action/ 的路由
    url(r'^event_manage/$',views.event_manage),  # 添加 event_manage/的路由
    url(r'^accounts/login/$',views.index),       # 添加auth认证后，直接访问event_manage页面，指引用户到登录页面
    url(r'^search_name/$',views.search_name),    # 添加 search_name/ 的路由
    url(r'^guest_manage/$',views.guest_manage),  # 添加 guest_manage/ 的路由
    url(r'^search_phone/$',views.search_phone),  # 添加 search_phone/ 的路由
    url(r'^sign_index/(?P<eid>[0-9]+)/$',views.sign_index),
    url(r'^sign_index_action/(?P<eid>[0-9]+)/$',views.sign_index_action),
    url(r'^logout/$',views.logout),
    url(r'^api/',include(('sign.urls','sign'),namespace = "sign")),
]

