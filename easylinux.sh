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



# @run

# 
python test.py &

#running at background 
nohup python test.py &

# @tar
tar -cvf /tmp/etc.tar /etc #only packet 
tar -zcvf /tmp/etc.tar.gz /etc # not only packet but also compress

tar -xvzf etc.tar.gz -C /tmp

# @ssh
scp -P 26551  debugger.zip root@45.78.29.252:/home #from windows to linux
sshpass -p root ssh -p6766 qsb@45.78.29.252 #sshpass input password directly
