"""
@FileName: sec_add_event_test.py
@desc:
@Author  :taozi 
@Time    :2019-12-10 11:30
"""
import unittest
import requests
import hashlib
from time import time
from django.views.decorators.csrf import csrf_exempt

class AddEventTest(unittest.TestCase):
    ''' 添加发布会 '''
    def setUp(self):
        self.base_url = "http://127.0.0.1:8000/api/sec_add_event/"
        # app_key
        self.api_key = "&Guest-Bugmaster"
        now_time = time()
        self.client_time = str(now_time).split('.')[0]
        # sign
        md5 = hashlib.md5()
        sign_str = self.client_time + self.api_key
        sign_bytes_utf8 = sign_str.encode(encoding="utf-8")
        md5.update(sign_bytes_utf8)
        self.sign_md5 = md5.hexdigest()
        print("self.sign_md5",self.sign_md5)

    # def tearDown(self):
    #     print("tearDown:",self.result)

    def test_add_event_request_error(self):
        ''' 请求方法错误'''
        r = requests.get(self.base_url)
        self.result = r.json()
        self.assertEqual(self.result['status'],10011)
        self.assertEqual(self.result['message'],'request error')

    @csrf_exempt     # 取消当前函数防跨站请求伪造功能，即便settings中设置了全局中间件。
    def test_add_event_sign_null(self):
        ''' 签名参数为空 '''
        payload = {'eid':'1','':'','limit':'','address':'','start_time':'','time':'','sign':''}
        r = requests.post(self.base_url,data=payload)
        self.result = r.json()
        self.assertEqual(self.result['status'],10012)
        self.assertEqual(self.result['message'],'user sign null')

    def test_add_event_time_out(self):
        ''' 请求超时 '''
        now_time = str(int(self.client_time) - 61)
        payload = {'eid':'1','':'','limit':'','address':'','start_time':'','time':now_time,'sign':'abc'}
        r = requests.post(self.base_url,data=payload)
        self.result = r.json()
        self.assertEqual(self.result['status'],10013)
        self.assertEqual(self.result['message'],'user sign timeout')

    def test_add_event_eid_exist(self):
        ''' 签名错误 '''
        payload = {'eid': '1', '': '', 'limit': '', 'address': '', 'start_time': '', 'time': self.client_time, 'sign': 'abc'}
        r = requests.post(self.base_url,data=payload)
        self.result = r.json()
        self.assertEqual(self.result['status'],10014)
        self.assertIn(self.result['message'],'user sign error')

    def test_add_event_success(self):
        ''' 添加成功 '''
        payload = {'eid':'19','name':'一加6手机发布会11','limit':'2000',
                   'address':'深圳宝体','start_time':'2019-12-10 16:30:00','time': self.client_time, 'sign': self.sign_md5}
        r = requests.post(self.base_url,data=payload)
        self.result = r.json()
        self.assertEqual(self.result['status'],200)
        self.assertEqual(self.result['message'], 'add event success')

if __name__ == '__main__':
    # test_data.init_data()   # 初始化接口测试数据
    unittest.main()
