"""
@FileName: run_tests.py
@desc:
@Author  :taozi 
@Time    :2019-08-21 9:25
"""
import time,sys
sys.path.append('./interface')
sys.path.append('./db_fixture')
from HTMLTestRunner import HTMLTestRunner
import unittest
from db_fixture import test_data

# 指定测试用例为当前文件夹下的interface 目录
test_dir = './interface'
discover = unittest.defaultTestLoader.discover(test_dir,pattern='*_test.py')

if __name__ == "__main__":
    test_data.init_data()  # 初始化接口测试数据

    # now = time.strftime("%Y-%m-%d %H:%M:%S")     # :是Python特殊字符，不能使用，否则与系统冲突而报错
    now = time.strftime("%Y-%m-%d %H_%M_%S")
    filename = './report/' + now + '_result.html'
    # filename = './report/'  + '123result.html'
    print("filename",filename)
    fp = open(filename,'wb')

    runner = HTMLTestRunner(stream = fp,
                            title = 'Guest Manage System Interface Test Report',
                            description = 'Tmplementation Example with:')
    runner.run(discover)
    fp.close()