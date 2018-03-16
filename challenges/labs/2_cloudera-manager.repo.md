####repo /etc/yum.repos.d

`sudo nano /etc/yum.repos.d/cloudera-manager.repo`

```aidl
[cloudera-manager]
# Packages for Cloudera Manager, Version 5, on RedHat or CentOS 7 x86_64           	  
name=Cloudera Manager
baseurl=https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/5.13/
gpgkey =https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/RPM-GPG-KEY-cloudera    
gpgcheck = 1
```

```aidl
[phadmin@lion ~]$ ls /etc/yum.repos.d
cloudera-manager.repo  epel.repo  epel-testing.repo  MariaDB.repo  redhat.repo  rh-cloud.repo
```

`sudo yum install cloudera-manager-daemons cloudera-manager-server`

`sudo chkconfig cloudera-scm-server on`

```aidl
[phadmin@lion ~]$ sudo /usr/share/cmf/schema/scm_prepare_database.sh -h 10.3.4.5 mysql scm scmuser password
JAVA_HOME=/usr/java/jdk1.8.0_161
Verifying that we can write to /etc/cloudera-scm-server
Creating SCM configuration file in /etc/cloudera-scm-server
Executing:  /usr/java/jdk1.8.0_161/bin/java -cp /usr/share/java/mysql-connector-java.jar:/usr/share/java/oracle-connector-java.jar:/usr/share/cmf/schema/../lib/* com.cloudera.enterprise.dbutil.DbCommandExecutor /etc/cloudera-scm-server/db.properties com.cloudera.cmf.db.
[                          main] DbCommandExecutor              INFO  Successfully connected to database.
All done, your SCM database is configured correctly!
```
```aidl
[phadmin@lion ~]$ sudo cat /etc/cloudera-scm-server/db.properties
# Auto-generated by scm_prepare_database.sh on Fre Mär 16 09:28:44 UTC 2018
#
# For information describing how to configure the Cloudera Manager Server
# to connect to databases, see the "Cloudera Manager Installation Guide."
#
com.cloudera.cmf.db.type=mysql
com.cloudera.cmf.db.host=10.3.4.5
com.cloudera.cmf.db.name=scm
com.cloudera.cmf.db.user=scmuser
com.cloudera.cmf.db.setupType=EXTERNAL
com.cloudera.cmf.db.password=password

```

```aidl
[phadmin@lion ~]$ sudo service cloudera-scm-server start
Starting cloudera-scm-server (via systemctl):              [  OK  ]

```
```aidl
[root@lion cloudera-scm-server]# cat cloudera-scm-server.log | grep "Starting SCM Server"
2018-03-16 09:31:30,804 INFO main:com.cloudera.server.cmf.Main: Starting SCM Server. JVM Args: [-Dlog4j.configuration=file:/etc/cloudera-scm-server/log4j.properties, -Dfile.encoding=UTF-8, -Dcmf.root.logger=INFO,LOGFILE, -Dcmf.log.dir=/var/log/cloudera-scm-server, -Dcmf.log.file=cloudera-scm-server.log, -Dcmf.jetty.threshhold=WARN, -Dcmf.schema.dir=/usr/share/cmf/schema, -Djava.awt.headless=true, -Djava.net.preferIPv4Stack=true, -Dpython.home=/usr/share/cmf/python, -XX:+UseConcMarkSweepGC, -XX:+UseParNewGC, -XX:+HeapDumpOnOutOfMemoryError, -Xmx2G, -XX:MaxPermSize=256m, -XX:+HeapDumpOnOutOfMemoryError, -XX:HeapDumpPath=/tmp, -XX:OnOutOfMemoryError=kill -9 %p], Args: [], Version: 5.13.2 (#6 built by jenkins on 20180205-1145 git: caa35e134bfc8a112ad1f3cae7d80a2b1f30796f)
```


```aidl
[root@lion cloudera-scm-server]# cat cloudera-scm-server.log | grep "Starting SCM Server"
2018-03-16 09:31:30,804 INFO main:com.cloudera.server.cmf.Main: Starting SCM Server. JVM Args: [-Dlog4j.configuration=file:/etc/cloudera-scm-server/log4j.properties, -Dfile.encoding=UTF-8, -Dcmf.root.logger=INFO,LOGFILE, -Dcmf.log.dir=/var/log/cloudera-scm-server, -Dcmf.log.file=cloudera-scm-server.log, -Dcmf.jetty.threshhold=WARN, -Dcmf.schema.dir=/usr/share/cmf/schema, -Djava.awt.headless=true, -Djava.net.preferIPv4Stack=true, -Dpython.home=/usr/share/cmf/python, -XX:+UseConcMarkSweepGC, -XX:+UseParNewGC, -XX:+HeapDumpOnOutOfMemoryError, -Xmx2G, -XX:MaxPermSize=256m, -XX:+HeapDumpOnOutOfMemoryError, -XX:HeapDumpPath=/tmp, -XX:OnOutOfMemoryError=kill -9 %p], Args: [], Version: 5.13.2 (#6 built by jenkins on 20180205-1145 git: caa35e134bfc8a112ad1f3cae7d80a2b1f30796f)
```

```aidl
[root@lion cloudera-scm-server]# cat cloudera-scm-server.log | grep -i "Started Jetty Server"
2018-03-16 09:33:12,882 INFO WebServerImpl:com.cloudera.server.cmf.WebServerImpl: Started Jetty server.

```