"""
@FileName: mysql_db.py
@desc:
@Author  :taozi 
@Time    :2019-08-21 9:47
"""
from pymysql import connect,cursors
from pymysql.err import OperationalError
import os
import configparser as cparser

# =============== 读取 db_config.ini 文件设置 =======================
base_dir = str(os.path.dirname(os.path.dirname(__file__)))
# from os.path import abspath, dirname
# base_dir = dirname(dirname(abspath(__file__)))
print("base_dir1 ---",base_dir)
base_dir = base_dir.replace('\\','/')
print("base_dir2 ---",base_dir)
file_path = base_dir + "/db_config.ini"
print("db_config.ini file_path：****",file_path)

cf = cparser.ConfigParser()
cf.read(file_path)
print("ini section is:",cf.sections())

host = cf.get("mysqlconf","host")
port = cf.get("mysqlconf","port")
db = cf.get("mysqlconf","db_name")
print("db_name is :",db)
user = cf.get("mysqlconf","user")
password = cf.get("mysqlconf","password")

# =============== 封装 MYSQL 基本操作 =======================
class DB:
    def __init__(self):
        try:
            # 连接数据库
            self.conn = connect(host = host,
                                port = int(port),
                                user = user,
                                password = password,
                                db = db,
                                charset = 'utf8mb4',
                                cursorclass = cursors.DictCursor)
        except OperationalError as  e:
            print("mysql Error %d:%s"%(e.args[0],e.args[1]))

    # 清除表数据
    def clear(self,table_name):
        # real_sql = "truncate table " + table_name + ";"
        real_sql = "delete from " + table_name + ";"
        with self.conn.cursor() as cursor:
            cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")     # 取消外键约束
            print(real_sql)
            cursor.execute(real_sql)
        self.conn.commit()

    # 插入表数据
    def insert(self,table_name,table_data):
        keys = {}
        for key in table_data:
            # 从数据字段中取出列名，列名用反单引号括起来；--解决列名与mysql关键字冲突
            keys[key] = "`" + str(key) + "`"
            table_data[key] = "'" + str(table_data[key]) + "'"
        key = ','.join(keys.values())
        print("key:",key)
        value = ','.join(table_data.values())
        print("value",value)

        real_sql = "INSERT INTO " + table_name + " (" + key + ") VALUES (" + value + ");"
        with self.conn.cursor() as cursor:
            cursor.execute(real_sql)

        self.conn.commit()

    # 关闭数据库连接
    def close(self):
        self.conn.close()

    # init data
    def init_data(self, datas):
        for table, data in datas.items():
            self.clear(table)
            for d in data:
                self.insert(table, d)
        self.close()


if __name__ == '__main__':
    db = DB()
    table_name = "sign_event"
    data = {'id':12,'name':'红米','limit':2000,'status':1,'address':'北京会展中心','start_time':'2019-08-21 10:51:05'}
    db.clear(table_name)
    db.insert(table_name,data)
    db.close()