"""
@FileName: creat_guest.py
@desc:
@Author  :taozi 
@Time    :2019-12-13 11:23
"""
f = open("guest.txt",'w')

for i in range(1,3000):
    str_i = str(i)
    realname = "jack" + str_i
    phone = 13800110000 + i
    email = "jack" + str_i + "@mail.com"
    sql = 'INSERT INTO sign_guest(realname,phone,email,sign,event_id)VALUES("'\
          + realname + '",' + str(phone)+ ',"' + email+',",0,1);'

    print(sql)

    f.write(sql)
    f.write("\n")

f.close()