# [bash]
# @Array
l = ('1','2')
echo ${#l[*]},${l[*]} #means array.len  and array.content

echo   $@ , $# ,$$ ,$! ,    #all of the params, params.len ,current uid,last uid


# [service or others]
# @iptables

#iptables -t 表名 <-A/I/D/R> 规则链名 [规则号] <-i/o 网卡名> -p 协议名 <-s 源IP/源子网> --sport 源端口 <-d 目标IP/目标子网> --dport 目标端口 -j 动作
#To view all of them ,if wanted now number add --line-numbers at end of it
	
iptables -L -n -v

# TO delete rules 
iptables -D INPUT 8

# TO disable ssh connetions
iptables -t filter -A INPUT -s 172.17.0.2 -p tcp --dport 8080 -j DROP

iptables -A INPUT -m iprange --src-range 192.168.8.1-192.168.8.255 -p tcp --dport 22 -j DROP
# TO Accept ssh connetions
iptables -A INPUT -s 192.168.8.115 -p tcp --dport 22 -j ACCEPT

# port mapping 80 to 8080
iptables -t nat -A OUTPUT -p tcp -d 127.0.0.1 --dport 8888 -j DNAT --to 127.0.0.1:9999 #local access
iptables -t nat -A PREROUTING -p tcp --dport 8888 -j REDIRECT --to-port 9999
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 192.168.4.177 --dport 80 -j DNAT --to 192.168.4.177:8080 
iptables -t nat -A POSTROUTING --dst 127.0.0.1 -p tcp --dport 9999 -j SNAT --to-source 172.17.0.1
# @nmap

nmap -PS 172.17.0.2-255 # scans port among ips

#@route
route add -host 172.16.21.180  gw 192.107.1.254 dev enp0s25

#@ lookup what is running 
netstat -anp
ps -ef -aux

# @run
route add -net 45.78.29.0 netmask 255.255.255.0 gw 172.16.0.1 dev enp0s25
route add -host 45.78.29.252  gw 192.168.43.1 dev wlp3s0
# 	
python test.py &

#running at background 
nohup python test.py &

# @tar
tar -cvf /tmp/etc.tar /etc #only packet 
tar -zcvf /tmp/etc.tar.gz /etc # not only packet but also compress
tar -xvzf etc.tar.gz -C /tmp
unzip aa.zip -d /usr/local

# @ssh
scp -P 26551  debugger.zip root@45.78.29.252:/home #from windows to linux
scp username@servername:/remote_path/filename ~/local_destination

scp -r username@servername:/remote_path/remote_dir/ ~/local_destination
scp  -r ~/local_dir username@servername:/remote_path/remote_dir

sshpass -p root ssh -p6766 qsb@45.78.29.252 #sshpass input password directly
nohup autossh -p 26551 -f -M 6701 -NR '*:6766:localhost:22' root@45.78.29.252 # redirct shell
ssh -CfNg -R 6666:127.0.0.1:22 root@45.78.29.252 #transport port
ssh -f -C2qTnN -D 6666root@45.78.29.252
ssh -p 22 root@45.78.29.252 'cmd'

pkill -KILL -t pts/1
# @git

# @mysql
source d:/dbname.sql #import data to database

# @ew
# port transfort
ew -s lcx_slave -d insideip -e 888 -f outsideip -g 999
ew -s lcx_listen -l 10800 -e 888
# @Regeorg
python reGeorgSocksProxy.py -l 172.16.1.248 -p 666 -u http://45.78.29.252/downme/tunnel.nosocket.php

# curl 
curl URL -A "Mozilla/5.0" # useragent
curl -X POST --data "data=xxx" example.com/form.cgi # post
curl --header "x-forwarded-for:127.0.0.1" --local-port 23333 -A SniperOJ-Web-Broswer http://120.24.215.80:10005/
curl --cookie "name=xxx" www.example.com  # cookie

# gcc
# -z execstack  
# -f no-stack-protector 
gcc 1.c -o vul -m32 -g -zexecstack -fno-stack-protector -g
#libcdatabase
./find printf 260 puts f30
./find __libc_start_main_ret a83
./dump libc6_2.19-0ubuntu6.6_i386
./identify /usr/lib/libc.so.6

#gdb libheap
heap -h #print help list
fastbins
fastbins 0x602c00
smallbins 1
heapls
heapls 0x602c00
freebins
mstats
p mp_ #
p *(mchunkptr) 0x608790
P *((struct _IO_FILE_plus*) 0x602400)
python print(malloc_chunk(0x608790))