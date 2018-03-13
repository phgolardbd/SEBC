# <center> Pre requisistes set up

see documentation for point 1 to 4 on (bear in mind that the section is "CDH install using command line but this applies to every kind of installation)
https://www.cloudera.com/documentation/enterprise/5-12-x/topics/install_cdh_dependencies.html

####1 - passwordless sudo for admin account
`sudo nano /etc/sudoers.d/waagent`
  
```aidl
  phadmin ALL=(ALL) NOPASSWD:ALL
  #phadmin ALL=(ALL) ALL
```
`

####2 - add epel
`cd /tmp`
`wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm`
`sudo yum install epel-release-latest-7.noarch.rpm`

####3 - update yum
`sudo yum update`


####1 - FQDN

`sudo hostnamectl set-hostname <myname>`

######then set the HOSTNAME in the /etc/sysconfig/network file
 `sudo nano /etc/sysconfig/network`
 ```
 NETWORKING=yes
 HOSTNAME=lion
 ```
 
 `sudo nano /etc/hosts` 
```aidl
10.0.151.180  lion.cdh-bootcamp-phg lion
10.0.149.69   elephant.cdh-bootcamp-phg elephant
10.0.159.156  horse.cdh-bootcamp-phg horse
10.0.158.220  tiger.cdh-bootcamp-phg tiger
10.0.156.72   monkey.cdh-bootcamp-phg monkey
```

######check with 
`uname -a`

####2- Disable SE Linux

`sudo nano /etc/selinux/config`
 
######SELINUX=disabled
 
 `getenforce` shows disabled
 
####3 - disable iptables and firewalls
  
  `systemctl stop iptables`
  
  `systemctl stop firewalld`
  
  `systemctl disable iptables`
  
  `systemctl disable firewalld`

######see documentation for point 1 to ?? on https://www.cloudera.com/documentation/enterprise/5-12-x/topics/cdh_admin_performance.html

####4 - Disable the tuned Service

`systemctl start tuned`

`tuned-adm off`



####5 - check the vm swappiness on all you nodes and set it to 1

`cat /proc/sys/vm/swappiness`
###### change swappiness at runtime
`sudo sysctl -w vm.swappiness=1`
######to make it permananet

`sudo nano /etc/sysctl.conf`
```aidl
vm.swappiness=1
```


####6 - Show the mount attributes of your volume(s)
#######If you have ext-based volumes, list the reserve space setting mounting the 1TB additionnal (on 5 hosts) to the `data`

#######find the name of this new disk 

`lsblk`
#######copy it
 - `sudo bash`
 - `mkfs -t ext4 /dev/nvme1n1`
 - `mount /dev/nvme1n1 /data/`
 - `df -k`
######show attributes

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p2   50G  1,2G   49G   3% /
devtmpfs        7,6G     0  7,6G   0% /dev
tmpfs           7,6G     0  7,6G   0% /dev/shm
tmpfs           7,6G  8,5M  7,6G   1% /run
tmpfs           7,6G     0  7,6G   0% /sys/fs/cgroup
tmpfs           1,6G     0  1,6G   0% /run/user/1001
/dev/nvme1n1    985G   77M  935G   1% /data
```

#####7 - Disable transparent hugepage support
######runtime
` cd /sys/kernel/mm/transparent_hugepage`
`cat defrag`
`echo never > defrag`

`echo never > /sys/kernel/mm/transparent_hugepage/defrag`
`echo never > /sys/kernel/mm/transparent_hugepage/enabled`
#####permanent

`sudo nano /etc/rc.d/rc.local`
```

echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo never > /sys/kernel/mm/transparent_hugepage/enabled
```
`sudo chmod +x /etc/rc.d/rc.local`
`sudo nano /boot/grub/grub.conf`
```aidl
transparent_hugepage=never
```
`sudo grub2-mkconfig -o /boot/grub2/grub.cfg`

####8 - List your network interface configuration

`ip a`

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 02:5c:ea:52:b6:08 brd ff:ff:ff:ff:ff:ff
    inet 10.0.149.69/20 brd 10.0.159.255 scope global dynamic eth0
       valid_lft 2817sec preferred_lft 2817sec
    inet6 fe80::5c:eaff:fe52:b608/64 scope link 
       valid_lft forever preferred_lft forever
```
#####9 - forward reverse hosts
`getent hosts`
```
127.0.0.1       localhost localhost.localdomain localhost4 localhost4.localdomain4
127.0.0.1       localhost localhost.localdomain localhost6 localhost6.localdomain6
10.0.151.180    lion
10.0.149.69     elephant
10.0.159.156    horse
10.0.158.220    tiger
10.0.156.72     monkey
```

####10 - ntp

#######ntpd => process point to common time serveers. important since we work with distributed systems so they need to have the semae time crucial for kerberos as it uses ticket with a certain validity so it needs time synchronisation

`sudo yum install ntp`
`sudo service ntpd start`
`sudo chkconfig ntpd on` to start @ boot

`ntpstat` 
#########to check if it synchronized to a ntp server

######FYI `sudo nano /etc/ntp.conf` you can see a list of ntp servers available


#####11 - install nscd

#######nscd => caching service (users groups, dns entries... useful for perfromances due to cache...) 

`sudo yum install nscd`
`sudo service nscd start`
`sudo chkconfig nscd on` to start @ boot

`sudo service nscd status` to check if it nscd is running


#####12 - MariaDB - only on the CM server node
#####add a MariaDB repo in /etc/yum.repos.d/ via nano

`sudo nano /etc/yum.repos.d/MariaDB.repo`
```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```
#####then run
`sudo yum install MariaDB-server MariaDB-client`

#####stop mariadb service (to then config mariadb)
`sudo service mariadb stop`
#####modify the /etc/my.cnf file to align with cloudera recommendations

`sudo nano /etc/my.cnf`
```aidl
[mysqld]
transaction-isolation = READ-COMMITTED
# Disabling symbolic-links is recommended to prevent assorted security risks;
# to do so, uncomment this line:
# symbolic-links = 0
key_buffer = 16M
key_buffer_size = 32M
max_allowed_packet = 32M
thread_stack = 256K
thread_cache_size = 64
query_cache_limit = 8M
query_cache_size = 64M
query_cache_type = 1
max_connections = 550
#expire_logs_days = 10
#max_binlog_size = 100M
#log_bin should be on a disk with enough free space. Replace '/var/lib/mysql/mysql_binary_log' with an appropriate path for your system
#and chown the specified folder to the mysql user.
log_bin=/var/lib/mysql/mysql_binary_log
binlog_format = mixed
read_buffer_size = 2M
read_rnd_buffer_size = 16M
sort_buffer_size = 8M
join_buffer_size = 8M
# InnoDB settings
innodb_file_per_table = 1
innodb_flush_log_at_trx_commit  = 2
innodb_log_buffer_size = 64M
innodb_buffer_pool_size = 4G
innodb_thread_concurrency = 8
innodb_flush_method = O_DIRECT
innodb_log_file_size = 512M
[mysqld_safe]
log-error=/var/log/mariadb/mariadb.log
pid-file=/var/run/mariadb/mariadb.pid
```
######enable mariadb @ boot
`sudo systemctl enable mariadb`
######check if enabled
`sudo systemctl list-unit-files | grep mariadb`
######set the root password for MariaDB (mine is)
`sudo /usr/bin/mysql_secure_installation`

#####script sql to create the dbs
`sudo nano /home/phadmin/script/create_db.sql`

```aidl
CREATE DATABASE cmserver DEFAULT CHARACTER SET utf8;
CREATE DATABASE rman DEFAULT CHARACTER SET utf8;
CREATE DATABASE metastore DEFAULT CHARACTER SET utf8;
CREATE DATABASE amon DEFAULT CHARACTER SET utf8;
CREATE DATABASE sentry DEFAULT CHARACTER SET utf8;
CREATE DATABASE nav DEFAULT CHARACTER SET utf8;
CREATE DATABASE navms DEFAULT CHARACTER SET utf8;
CREATE DATABASE hue DEFAULT CHARACTER SET utf8;
CREATE DATABASE oozie DEFAULT CHARACTER SET utf8;

GRANT ALL on cmserver.* TO 'cmserveruser'@'%' IDENTIFIED BY 'password';
GRANT ALL on rman.* TO 'rmanuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on metastore.* TO 'hiveuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on amon.* TO 'amonuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on sentry.* TO 'sentryuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on nav.* TO 'navuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on navms.* TO 'navmsuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on hue.* TO 'hueuser'@'%' IDENTIFIED BY 'password';
GRANT ALL on oozie.* TO 'oozieuser'@'%' IDENTIFIED BY 'password';
```

####13 - set up jdbc driver

`cd /tmp/`
`wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz`
`tar zxvf mysql-connector-java-5.1.40.tar.gz`
`sudo cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar`

####14 - set up oracle jdk 8
####### set up java alternatives

```aidl
sudo tar zxvf jdk-8u152-linux-x64.tar.gz
sudo cp /opt/jdk1.8.0_152 -R /usr/java


sudo alternatives --install /usr/bin/java java  /usr/java/bin/java 1000
sudo alternatives --install /usr/bin/javac javac  /usr/java/bin/javac 1000

sudo alternatives --set jar /opt/jdk1.8.0_152/bin/jar
sudo alternatives --set javac /opt/jdk1.8.0_152/bin/javac
```
###### export java_home and jre_home
`sudo nano /etc/default/cloudera-scm-server`
```aidl
export JAVA_HOME=/opt/jdk1.8.0_152
export JRE_HOME=/opt/jdk1.8.0_152/jre
```

###### modif the path variable value

`nano .bash_profile`
```aidl
....
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$JAVA_HOME/bin:$JRE_HOME
export PATH
```
####15 - set up CM server
```
https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/cloudera-manager.repo
```
`sudo nano /etc/yum.repos.d/cloudera-manager.repo`
```aidl
[cloudera-manager]
# Packages for Cloudera Manager, Version 5, on RedHat or CentOS 7 x86_64           	  
name=Cloudera Manager
baseurl=https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/5.9/
gpgkey =https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/RPM-GPG-KEY-cloudera    
gpgcheck = 1
```

`sudo yum install cloudera-manager-daemons cloudera-manager-server`

######cloudera manager start on boot
`sudo chkconfig cloudera-scm-server on`

