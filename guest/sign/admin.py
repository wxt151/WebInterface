from django.contrib import admin
from sign.models import Event,Guest

# Register your models here.

class EventAdmin(admin.ModelAdmin):
    list_display = ['id','name','status','address','start_time']
    search_fields = ['name']  # 搜索栏
    list_filter = ['status']  # 过滤器


@admin.register(Guest)
class GuestAdmin(admin.ModelAdmin):
    """ 装饰器的注册方式 """
    list_display = ['realname','phone','email','sign','create_time','event']
    search_fields = ['realname', 'phone']  # 搜索栏
    list_filter = ['sign']                 # 过滤器

# 为了让 admin 界面管理某个数据模型，我们需要先注册该数据模型到 admin
admin.site.register(Event,EventAdmin)
# admin.site.register(Guest)
