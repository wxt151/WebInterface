"""
@FileName: thread_if_test.py
@desc:
@Author  :taozi 
@Time    :2019-12-14 17:56
"""

import requests
import threading
from time import time

# 签到接口基本地址

base_url = "http://172.128.128.104:8089"

# 签到线程
def sign_thread(start_user,end_usr):
    for i in  range(start_user,end_usr):
        phone = 13800110000 + i
        datas = {"eid":1,"phone":phone}
        r = requests.post(base_url + '/api/user_sign/',data = datas)
        result = r.json()
        try:
            assert result['message'] == "sign success"
        except AssertionError as e:
            print("phone:" + str(phone) + ", user sign fail!")

# 设置用户分组 （即 5 个线程）
lists = {1:601,601:1201,1201:1801,1801:2401,2401:3001}

# 创建线程数组
threads = []

# 创建线程
for start_user,end_user in lists.items():
    t = threading.Thread(target=sign_thread,args=(start_user,end_user))
    threads.append(t)

if __name__ == "__main__":
    # 开始时间
    start_time = time()

    # 启动线程
    for i in range(len(lists)):
        threads[i].start()
    for i in range(len(lists)):
        threads[i].join()

    # 结束时间
    end_time = time()
    print("start time:" + str(start_time))
    print("end time:" + str(end_time))
    print("run time:" + str(end_time - start_time))
