"""
@FileName: Interface_AES_test.py
@desc:
@Author  :taozi 
@Time    :2019-12-11 09:55
"""
from Crypto.Cipher import AES
import base64
import requests
import unittest
import json
from django.views.decorators.csrf import csrf_exempt

class AESTest(unittest.TestCase):

    def setUp(self):
        BS = 16
        self.pad = lambda s:s + (BS - len(s) % BS) * chr(BS - len(s) % BS)

        self.base_url = "http://127.0.0.1:8000/api/sec_get_guest_list/"
        self.app_key = 'W7v4D60fds2Cmk2U'

    def encryptBase64(self,src):
        return base64.urlsafe_b64encode(src)

    def encryptAES(self,src,key):
        """ 生成AES密文 """
        iv = b"1172311105789011"
        cryptor = AES.new(key,AES.MODE_CBC,iv)
        ciphertext = cryptor.encrypt(self.pad(src))
        return self.encryptBase64(ciphertext)

    def test_aes_interface(self):
        ''' test aes interface '''
        payload = {'eid':'1','phone':''}
        # 加密
        encoded = self.encryptAES(json.dumps(payload),self.app_key).decode()

        r = requests.post(self.base_url,data={"data":encoded})
        print(r)
        result = r.json()
        print(result)
        self.assertEqual(result['status'],200)
        self.assertEqual(result['message'],'success')

    def test_get_guest_list_request_error(self):
        ''' request error '''
        payload = {'eid':'','phone':''}
        encoded = self.encryptAES(json.dumps(payload),self.app_key).decode()

        r = requests.get(self.base_url, data={"data": encoded})
        result = r.json()
        self.assertEqual(result['status'], 10011)
        self.assertEqual(result['message'], 'request error')

    def test_get_guest_list_eid_null(self):
        ''' eid 参数为空 '''
        payload = {'eid':'','phone':''}
        encoded = self.encryptAES(json.dumps(payload),self.app_key).decode()

        r = requests.post(self.base_url, data={"data": encoded})
        result = r.json()
        self.assertEqual(result['status'], 10021)
        self.assertEqual(result['message'], 'eid cannot be empty')

    def test_get_guest_list_eid_error(self):
        ''' 根据 eid 查询结果为空 '''
        payload = {'eid':'901','phone':''}
        encoded = self.encryptAES(json.dumps(payload),self.app_key).decode()

        r = requests.post(self.base_url, data={"data": encoded})
        result = r.json()
        self.assertEqual(result['status'], 10022)
        self.assertEqual(result['message'], 'query result is empty')

    def test_get_guest_list_eid_success(self):
        ''' 根据 eid 查询结果成功 '''
        payload = {'eid':'1','phone':''}
        encoded = self.encryptAES(json.dumps(payload),self.app_key).decode()

        r = requests.post(self.base_url, data={"data": encoded})
        result = r.json()
        print(result)
        self.assertEqual(result['status'], 200)
        self.assertEqual(result['message'], 'success')
        self.assertEqual(result['data'][0]['realname'], 'alen')
        self.assertEqual(result['data'][0]['phone'], '13511001100')

    def test_get_guest_list_eid_phone_null(self):
        ''' 根据 eid 和 phone 查询结果为空 '''
        payload = {'eid':'2','phone':'100000000000'}
        encoded = self.encryptAES(json.dumps(payload),self.app_key).decode()

        r = requests.post(self.base_url, data={"data": encoded})
        print("requests.post:",r)
        result = r.json()
        self.assertEqual(result['status'], 10022)
        self.assertEqual(result['message'], 'query result is empty')

    @csrf_exempt
    def test_get_guest_list_eid_phone_success(self):
        ''' 根据 eid 和 phone 查询结果为空 '''
        payload = {'eid':'1','phone':'13511001100'}
        encoded = self.encryptAES(json.dumps(payload),self.app_key).decode("utf-8")

        r = requests.post(self.base_url, data={"data": encoded})
        print("requests.post:",r)
        result = r.json()
        print(result)
        self.assertEqual(result['status'], 200)
        self.assertEqual(result['message'], 'success')
        # 注意：eid 和 phone 联合查询时服务器认为查询结果只有一个字典，而不是字典列表，所以不能用result['data'][0] 否则有KeyError报错
        # self.assertEqual(result['data'][0]['realname'], 'alen')
        self.assertEqual(result['data']['realname'], 'alen')
        self.assertEqual(result['data']['phone'], '13511001100')

if __name__ == "__main__":
    unittest.main()