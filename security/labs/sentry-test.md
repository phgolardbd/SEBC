#####Verify user privileges

`kinit phgolardbd`

`beeline`

`!connect jdbc:hive2://localhost:10000/default;principal=hive/elephant.cdh-bootcamp-phg@CDH.BOOTCAMP.PHG`

```aidl
0: jdbc:hive2://localhost:10000/default> show tables;
INFO  : Compiling command(queryId=hive_20180315141111_7f69115f-24c0-4aac-8c5b-e7fbd98cca4e): show tables
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20180315141111_7f69115f-24c0-4aac-8c5b-e7fbd98cca4e); Time taken: 0.065 seconds
INFO  : Executing command(queryId=hive_20180315141111_7f69115f-24c0-4aac-8c5b-e7fbd98cca4e): show tables
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20180315141111_7f69115f-24c0-4aac-8c5b-e7fbd98cca4e); Time taken: 0.184 seconds
INFO  : OK
+-----------+--+
| tab_name  |
+-----------+--+
+-----------+--+
No rows selected (0.265 seconds)

```

####Create a Sentry role with full authorization

```aidl
CREATE ROLE sentry_admin;
GRANT ALL ON SERVER server1 TO ROLE sentry_admin;
GRANT ROLE sentry_admin TO GROUP phgolardbd;
SHOW TABLES;
```


```aidl
0: jdbc:hive2://localhost:10000/default> show tables;
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20180315142828_7f552ab7-771a-4975-8ae4-b33bc15d9d2f); Time taken: 0.178 seconds
INFO  : OK
+------------+--+
|  tab_name  |
+------------+--+
| customers  |
| sample_07  |
| sample_08  |
| web_logs   |
+------------+--+
4 rows selected (0.263 seconds)

```

####Create additional test users
Add new users to all cluster nodes

```aidl
sudo groupadd selector
sudo groupadd inserters
sudo useradd -u 1100 -g selector george
sudo useradd -u 1200 -g inserters ferdinand
kadmin.local
addprinc george
(password)
addprinc ferdinand
(password)

```

###Create test roles
Login to beeline as your admin user
```aidl
CREATE ROLE reads;
CREATE ROLE writes;
```

###Grant read privilege for all tables to reads
```aidl
GRANT SELECT ON DATABASE default TO ROLE reads;
GRANT ROLE reads TO GROUP selector;
Grant INSERT privilege for default.sample07 to 'writes':
REVOKE ALL ON DATABASE default FROM ROLE writes;
GRANT INSERT ON default.sample_07 TO ROLE writes;
GRANT ROLE writes TO GROUP inserters;
```
george should see all tables
```aidl
kinit george
beeline
!connect jdbc:hive2://localhost:10000/default;principal=hive/elephant.cdh-bootcamp-phg@CDH.BOOTCAMP.PHG

SHOW TABLES;
```
```aidl
[phadmin@elephant ~]$ kinit george
Password for george@CDH.BOOTCAMP.PHG: 
[phadmin@elephant ~]$ beeline
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512M; support was removed in 8.0
Beeline version 1.1.0-cdh5.9.3 by Apache Hive
beeline> !connect jdbc:hive2://localhost:10000/default;principal=hive/elephant.cdh-bootcamp-phg@CDH.BOOTCAMP.PHG
scan complete in 2ms
Connecting to jdbc:hive2://localhost:10000/default;principal=hive/elephant.cdh-bootcamp-phg@CDH.BOOTCAMP.PHG
Connected to: Apache Hive (version 1.1.0-cdh5.9.3)
Driver: Hive JDBC (version 1.1.0-cdh5.9.3)
Transaction isolation: TRANSACTION_REPEATABLE_READ
0: jdbc:hive2://localhost:10000/default> 
0: jdbc:hive2://localhost:10000/default> SHOW TABLES;
INFO  : Compiling command(queryId=hive_20180315145757_e6109805-6308-4abd-8be7-7f38139e7fde): SHOW TABLES
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20180315145757_e6109805-6308-4abd-8be7-7f38139e7fde); Time taken: 0.078 seconds
INFO  : Executing command(queryId=hive_20180315145757_e6109805-6308-4abd-8be7-7f38139e7fde): SHOW TABLES
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20180315145757_e6109805-6308-4abd-8be7-7f38139e7fde); Time taken: 0.321 seconds
INFO  : OK
+------------+--+
|  tab_name  |
+------------+--+
| customers  |
| sample_07  |
| sample_08  |
| web_logs   |
+------------+--+
4 rows selected (0.515 seconds)

```


```aidl
kinit ferdinand
beeline
!connect jdbc:hive2://localhost:10000/default;principal=hive/elephant.cdh-bootcamp-phg@CDH.BOOTCAMP.PHG

```
ferdinand should see sample_07

```aidl
[phadmin@elephant ~]$ kinit ferdinand
Password for ferdinand@CDH.BOOTCAMP.PHG: 
[phadmin@elephant ~]$ beeline
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512M; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=512M; support was removed in 8.0
Beeline version 1.1.0-cdh5.9.3 by Apache Hive
beeline> !connect jdbc:hive2://localhost:10000/default;principal=hive/elephant.cdh-bootcamp-phg@CDH.BOOTCAMP.PHG
scan complete in 2ms
Connecting to jdbc:hive2://localhost:10000/default;principal=hive/elephant.cdh-bootcamp-phg@CDH.BOOTCAMP.PHG
Connected to: Apache Hive (version 1.1.0-cdh5.9.3)
Driver: Hive JDBC (version 1.1.0-cdh5.9.3)
Transaction isolation: TRANSACTION_REPEATABLE_READ
0: jdbc:hive2://localhost:10000/default> show tables;
INFO  : Compiling command(queryId=hive_20180315145959_09ce8fdb-9fe6-4f92-a4b1-40205a3eb150): show tables
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20180315145959_09ce8fdb-9fe6-4f92-a4b1-40205a3eb150); Time taken: 0.103 seconds
INFO  : Executing command(queryId=hive_20180315145959_09ce8fdb-9fe6-4f92-a4b1-40205a3eb150): show tables
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20180315145959_09ce8fdb-9fe6-4f92-a4b1-40205a3eb150); Time taken: 0.323 seconds
INFO  : OK
+------------+--+
|  tab_name  |
+------------+--+
| sample_07  |
+------------+--+
1 row selected (0.556 seconds)
```