"""
@FileName: locustfile.py
@desc:
@Author  :taozi 
@Time    :2019-12-14 17:29
"""
from locust import HttpLocust,TaskSet,task
from random import randint

# Web 性能测试
class UserBehavior(TaskSet):

    @task
    def user_sign(self):
        number = randint(1,3001)
        phone = 13800110000 + number
        str_phone = str(phone)
        self.client.post("/api/user_sign/",data = {"eid":"1",
                                                   "phone":str_phone})

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 3000
    max_wait = 6000