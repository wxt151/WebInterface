"""
@FileName: test.py
@desc:
@Author  :taozi 
@Time    :2019-12-13 15:21
"""

def application(env,start_response):
    start_response('200 OK',[('Content-Type','text/html')])
    return [b"Hello World"]