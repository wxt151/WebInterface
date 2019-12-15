"""
@FileName: locustfile.py
@desc:
@Author  :taozi 
@Time    :2019-12-13 10:50
"""
from locust import HttpLocust,TaskSet,task

# Web 性能测试
class UserBehavior(TaskSet):

    @task(1)
    def baidu_page(self):
        self.client.get("/")

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 3000
    max_wait = 6000