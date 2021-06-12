#!/bin/bash
# date:2019-12
# auto install zabbix-agent
 
# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
# User specific environment and startup programs
export PATH
 
# 获取操作系统位数
sys_num=`getconf LONG_BIT`
# zabbix服务端IP
ServerIP='zabbix.365starlink.tk'
# 获取客户端服务器的IP
AgentIP=`ip a show dev eth0|grep -w inet|awk '{print $2}'|awk -F '/' '{print $1}'`
# 配置文件
zabbix_config='/etc/zabbix/zabbix_agentd.conf'
# 获取数据
case $1 in 
    Centos6)
        checkAgent=`rpm -qa | grep 'zabbix-agent'`
        if [ -z $checkAgent ];then
         if [ $sys_num -eq 64 ];then
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/6/x86_64/zabbix-agent-4.2.6-1.el6.x86_64.rpm 
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
             service zabbix-agent restart
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi
         else
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/6/i386/zabbix-agent-4.2.6-1.el6.i686.rpm
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
             service zabbix-agent restart
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi
         fi
        else
          echo "Zabbix-agent has been installed in this system !"
        fi 
        ;; 
    Centos7)
        checkAgent=`rpm -qa | grep 'zabbix-agent'`
        if [ -z $checkAgent ];then
         if [ $sys_num -eq 64 ];then
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-agent-4.2.6-1.el7.x86_64.rpm
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
             systemctl restart zabbix-agent
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi           
         else
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-agent-4.2.6-1.el7.x86_64.rpm
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi
         fi
        else
          echo "Zabbix-agent has been installed in this system !"
        fi
        ;;
    RedHat6)
        checkAgent=`rpm -qa | grep 'zabbix-agent'`
        if [ -z $checkAgent ];then
         if [ $sys_num -eq 64 ];then
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/6/x86_64/zabbix-agent-4.2.6-1.el6.x86_64.rpm 
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
             service zabbix-agent restart
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi
         else
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/6/i386/zabbix-agent-4.2.6-1.el6.i686.rpm
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
             service zabbix-agent restart
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi
         fi
        else
          echo "Zabbix-agent has been installed in this system !"
        fi 
        ;; 
    RedHat7)
        checkAgent=`rpm -qa | grep 'zabbix-agent'`
        if [ -z $checkAgent ];then
         if [ $sys_num -eq 64 ];then
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-agent-4.2.6-1.el7.x86_64.rpm
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
             systemctl restart zabbix-agent
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi           
         else
           rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-agent-4.2.6-1.el7.x86_64.rpm
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi
         fi
        else
          echo "Zabbix-agent has been installed in this system !"
        fi
        ;;
    Ubuntu)
        checkAgent=`dpkg -l | grep zabbix-agent`
        if [ -z $checkAgent ];then
           apt-get install zabbix-agent
           if [ -z $checkAgent ];then
             sed -i "s/Server=127.0.0.1/Server=$ServerIP/" $zabbix_config
             sed -i "s/ServerActive=127.0.0.1/ServerActive=$ServerIP/" $zabbix_config
             sed -i "s/Hostname=Zabbix server/Hostname=$AgentIP/" $zabbix_config
             service zabbix-agent restart
           else
             echo 'Zabbix-agent install failed ! please run again .'
           fi           
        else
          echo "Zabbix-agent has been installed in this system !"
        fi
        ;;
        *) 
        echo "Usage:$0(Centos6|Centos7|Ubuntu|RedHat6|RedHat7)" 
        ;; 
esac
