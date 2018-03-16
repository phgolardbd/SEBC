#### MariaDB version
```aidl
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

#### hsow databases and server version
```aidl
[phadmin@elephant ~]$ mysql -uroot -proot
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.1.31-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| hive               |
| hue                |
| information_schema |
| mysql              |
| oozie              |
| performance_schema |
| rman               |
| scm                |
+--------------------+
8 rows in set (0.00 sec)

MariaDB [(none)]> 

```