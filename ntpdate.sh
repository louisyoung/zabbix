#!/bin/bash
#查看系统版本，如果为centos7则
if egrep "7.[0-9]" /etc/redhat-release &>/dev/null;
then
        timedatectl set-timezone Asia/Shanghai
        ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
        yum -y install ntpdate
        ntpdate ntp1.aliyun.com
        hwclock --systohc
        if ! grep "*/10 * * * * ntpdate ntp1.aliyun.com" /etc/crontab &>/dev/null;
        then
                echo "*/10 * * * * ntpdate ntp1.aliyun.com" >> /etc/crontab
        fi
        echo "susses 7..."
elif egrep "8.[0-9]" /etc/redhat-release &>/dev/null;
then
        if ! grep "ntp.aliyun.com" /etc/chrony.conf &>/dev/null;
        then
                contents="pool 2.centos.pool.ntp.org"
                recontents="server ntp.aliyun.com iburst"
                #第三行后添加内容
                sed -i "3a$recontents" /etc/chrony.conf
                #将内容注释掉
                sed -i "s/$contents/#$contents/g" /etc/chrony.conf
        fi
        systemctl restart chronyd.service
        #设置开机自启
        systemctl enable chrony.service
        chronyc sources -v
        echo "susses 8..."
fi

