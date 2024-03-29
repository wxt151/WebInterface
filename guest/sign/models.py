"""
Django的模型文件，创建应用程序数据表模型(对应数据库的相关操作)。
"""
from django.db import models

# Create your models here.

class Event(models.Model):
    """ 发布会表 """
    name = models.CharField(max_length=100)                 # 发布会标题
    limit = models.IntegerField()                           # 参加人数
    status = models.BooleanField()                          # 状态
    address = models.CharField(max_length=200)              # 地址
    start_time = models.DateTimeField('events time')        # 发布会时间
    create_time = models.DateTimeField(auto_now = True)     # 创建时间（自动获取当前时间）

    def __str__(self):
        return self.name

class Guest(models.Model):
    """ 嘉宾表 """
    event = models.ForeignKey(Event,on_delete=models.CASCADE)           # 关联发布会id
    realname = models.CharField(max_length=64)                          # 姓名
    phone = models.CharField(max_length=16)                             # 手机号
    email = models.EmailField()                                         # 邮箱
    sign = models.BooleanField()                                        # 签到状态
    create_time = models.DateTimeField(auto_now=True)                   # 创建时间（自动获取当前时间）

    class Meta:
        unique_together = ("event","phone")

    def __str__(self):
        return self.realname