"""
@FileName: module.py
@desc:   实现简单计算器：+、-、*、/、
@Author  :taozi 
@Time    :2019-08-15 11:09
"""
class Calculator(object):
    '''实现两个数的加、减、乘、除'''
    def __init__(self,a,b):
        self.a = int(a)
        self.b = int(b)

    # 加法
    def add(self):
        return self.a + self.b
    # 减法
    def sub(self):
        return self.a - self.b
    # 乘法
    def mul(self):
        return self.a * self.b

    # 除法
    def div(self):
        return self.a / self.b