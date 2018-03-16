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

```aidl
cd /tmp
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install epel-release-latest-7.noarch.rpm
```

####3 - update yum

`sudo yum update`


####1 - FQDN

`sudo hostnamectl set-hostname lion.cdh-bootcamp-phg`

`sudo hostnamectl set-hostname elephant.cdh-bootcamp-phg`

`sudo hostnamectl set-hostname horse.cdh-bootcamp-phg`

`sudo hostnamectl set-hostname tiger.cdh-bootcamp-phg`

`sudo hostnamectl set-hostname monkey.cdh-bootcamp-phg`


######then set the HOSTNAME in the /etc/sysconfig/network file
 `sudo nano /etc/sysconfig/network`
 
 ```
 NETWORKING=yes
 HOSTNAME=lion.cdh-bootcamp-phg
 ```
 
 ```
NETWORKING=yes
HOSTNAME=elephant.cdh-bootcamp-phg
  ```
  
```
NETWORKING=yes
HOSTNAME=horse.cdh-bootcamp-phg
```
   
```
NETWORKING=yes
HOSTNAME=tiger.cdh-bootcamp-phg
```
    
```
NETWORKING=yes
HOSTNAME=monkey.cdh-bootcamp-phg
```
 
 `sudo nano /etc/hosts` 
 
```aidl
10.3.4.4  lion.cdh-bootcamp-phg lion
10.3.4.5  elephant.cdh-bootcamp-phg elephant
10.3.4.6  horse.cdh-bootcamp-phg horse
10.3.4.7  tiger.cdh-bootcamp-phg tiger
10.3.4.8  monkey.cdh-bootcamp-phg monkey
```

######check with 

`uname -a`

```aidl
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub lion

ssh-copy-id -i ~/.ssh/id_rsa.pub elephant
ssh-copy-id -i ~/.ssh/id_rsa.pub horse
ssh-copy-id -i ~/.ssh/id_rsa.pub tiger
ssh-copy-id -i ~/.ssh/id_rsa.pub monkey
```

####2- Disable SE Linux

`sudo nano /etc/selinux/config`
 
 
```
SELINUX=disabled
```
 
 `getenforce` 
 
 shows disabled
 
####3 - disable iptables and firewalls
  
  `systemctl stop iptables`
  
  `systemctl stop firewalld`
  
```aidl
sudo su -
systemctl stop firewalld
systemctl disable firewalld
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
```

######see documentation for point 1 to ?? on https://www.cloudera.com/documentation/enterprise/5-12-x/topics/cdh_admin_performance.html


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

#######find the name of this new disk OUTADTED (AWS) 

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

#####6 - disable tuned

`sudo systemctl stop tuned`
`sudo systemctl disable tuned`


#####7 - Disable transparent hugepage support



######runtime

`cat /sys/kernel/mm/transparent_hugepage/defrag`

`echo never > /sys/kernel/mm/transparent_hugepage/defrag`

`echo never > /sys/kernel/mm/transparent_hugepage/enabled`

#####permanent

`sudo nano /etc/rc.d/rc.local`
```
echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo never > /sys/kernel/mm/transparent_hugepage/enabled
```
`sudo chmod +x /etc/rc.d/rc.local`

`sudo mkdir -p /boot/grub/`

`sudo nano /boot/grub/grub.conf`

```aidl
transparent_hugepage=never
```

`sudo grub2-mkconfig -o /boot/grub2/grub.cfg`

If it doesn't work

`sudo nano /etc/init.d/disable-transparent-hugepages`

```aidl
#!/bin/sh
### BEGIN INIT INFO
# Provides:          disable-transparent-hugepages
# Required-Start:    $local_fs
# Required-Stop:
# X-Start-Before:    mongod mongodb-mms-automation-agent
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Disable Linux transparent huge pages
# Description:       Disable Linux transparent huge pages, to improve
#                    database performance.
### END INIT INFO

case $1 in
  start)
    if [ -d /sys/kernel/mm/transparent_hugepage ]; then
      thp_path=/sys/kernel/mm/transparent_hugepage
    elif [ -d /sys/kernel/mm/redhat_transparent_hugepage ]; then
      thp_path=/sys/kernel/mm/redhat_transparent_hugepage
    else
      return 0
    fi

    echo 'never' > ${thp_path}/enabled
    echo 'never' > ${thp_path}/defrag

    unset thp_path
    ;;
esac
```
```aidl
sudo chmod 755 /etc/init.d/disable-transparent-hugepages

sudo chkconfig --add disable-transparent-hugepages
```

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
10.3.9.4    lion
10.3.9.5     elephant
10.3.9.6    horse
10.3.9.7    tiger
10.3.9.8    monkey
```

####10 - ntp

#######ntpd => process point to common time serveers. important since we work with distributed systems so they need to have the semae time crucial for kerberos as it uses ticket with a certain validity so it needs time synchronisation

`sudo yum install -y ntp`

`sudo service ntpd start`

`sudo chkconfig ntpd on` 

to start @ boot

`ntpstat` 

#########to check if it synchronized to a ntp server

######FYI `sudo nano /etc/ntp.conf` you can see a list of ntp servers available


#####11 - install nscd

#######nscd => caching service (users groups, dns entries... useful for perfromances due to cache...) 

`sudo yum install -y nscd`

`sudo service nscd start`

`sudo chkconfig nscd on` 

to start @ boot

`sudo service nscd status` 
to check if it nscd is running


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

`sudo service mariadb start`

`sudo /usr/bin/mysql_secure_installation`

#####script sql to create the dbs

`sudo nano mkdir -p script`



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


`mysql -uroot -proot < /home/phadmin/script/create_db.sql`

####13 - set up jdbc driver

```aidl
cd /tmp/
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz
tar zxvf mysql-connector-java-5.1.40.tar.gz
sudo mkdir -p /usr/share/java/
sudo cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar
```

`cd /tmp/`
`wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz`
`tar zxvf mysql-connector-java-5.1.40.tar.gz`
`sudo cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar`

####14 - set up oracle jdk 8
####### set up java alternatives

```aidl
cd /tmp/
wget http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"
tar zxvf jdk-8u161-linux-x64.tar.gz
sudo mkdir -p /usr/java
sudo cp -R /tmp/jdk1.8.0_161  /usr/java

sudo alternatives --install /usr/bin/java java  /usr/java/jdk1.8.0_161/bin/java 1000
sudo alternatives --install /usr/bin/javac javac  /usr/java/jdk1.8.0_161/bin/javac 1000


```

```aidl

sudo tar zxvf jdk-8u152-linux-x64.tar.gz
sudo cp -R /tmp/jdk1.8.0_161  /usr/java



sudo alternatives --install /usr/bin/java java  /usr/java/jdk1.8.0_161/bin/java 1000
sudo alternatives --install /usr/bin/javac javac  /usr/java/jdk1.8.0_161/bin/javac 1000

sudo alternatives --set jar /usr/java/jdk1.8.0_161/bin/jar
sudo alternatives --set javac /usr/java/jdk1.8.0_152/bin/javac
```
###### export java_home and jre_home

`sudo nano /etc/environment`

export JAVA_HOME=/usr/java/jdk1.8.0_161
export JRE_HOME=/usr/java/jdk1.8.0_161/jre

`sudo nano ~/.bash_profile`

```aidl
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$JAVA_HOME/bin:$JRE_HOME
export PATH
```

```aidl
sudo su
nano ~/.bash_profilee
```
```aidl
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$JAVA_HOME/bin:$JRE_HOME
export PATH
```

####### attention do that after setup (in case of issue with java)

`sudo nano /etc/default/cloudera-scm-server`

```aidl
export JAVA_HOME=/usr/java/jdk1.8.0_161
export JRE_HOME=/usr/java/jdk1.8.0_161/jre
```

###### modif the path variable value

`nano .bash_profile`
```aidl
....
export JAVA_HOME=/usr/java/jdk1.8.0_161
export JRE_HOME=/usr/java/jdk1.8.0_161/jre
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

#####prepare databases for cmserver
`sudo /usr/share/cmf/schema/scm_prepare_database.sh mysql cmserver cmserveruser password`
`sudo service cloudera-scm-server on`

#####question
I had a heap size issue when I tried to start the cloudera-scm-server service


/etc/init.d/cloudera-scm-server: line 292: [[: [error] JVM PermGen is set less than 256m, CM server may run out of PermGen space. Update CMF_JAVA_OPTS in /etc/default/cloudera-scm-server to fix this.: syntax error: operand expected (error token is "[error] JVM PermGen is set less than 256m, CM server may run out of PermGen space. Update CMF_JAVA_OPTS in /etc/default/cloudera-scm-server to fix this.")

so I had to modify the file /etc/default/cloudera-scm-server

```aidl
#
# Specify any command line arguments for the Cloudera SCM Server here.
#

CMF_SERVER_ARGS=""

#
# Locate the JDBC driver jar file.
#
# The default value is the default system mysql driver on RHEL/CentOS/Ubuntu
# and the standard, documented location for where to put the oracle jar in CM
# deployments.
#

export CMF_JDBC_DRIVER_JAR="/usr/share/java/mysql-connector-java.jar:/usr/share/java/oracle-connector-java.jar"

#
# Java Options.
#
# Default value sets Java maximum heap size to 2GB, and Java maximum permanent
# generation size to 256MB.
#

export CMF_JAVA_OPTS="-Xmx2G -XX:MaxPermSize=256m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp"
export JAVA_HOME=/usr/java/jdk1.8.0_161
export JRE_HOME=/usr/java/jdk1.8.0_161
```




ssh -L 7180:localhost:7180 phadmin@52.169.236.34