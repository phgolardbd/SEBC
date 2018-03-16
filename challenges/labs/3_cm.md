###user dir
```aidl
[phadmin@elephant ~]$ hdfs dfs -ls /user
Found 8 items
drwxr-xr-x   - admin  admin           0 2018-03-16 10:20 /user/admin
drwxr-xr-x   - anupam anupam          0 2018-03-16 10:23 /user/anupam
drwxr-xr-x   - hilary hilary          0 2018-03-16 10:23 /user/hilary
drwxrwxrwx   - mapred hadoop          0 2018-03-16 10:09 /user/history
drwxrwxr-t   - hive   hive            0 2018-03-16 10:10 /user/hive
drwxrwxr-x   - hue    hue             0 2018-03-16 10:10 /user/hue
drwxrwxr-x   - impala impala          0 2018-03-16 10:10 /user/impala
drwxrwxr-x   - oozie  oozie           0 2018-03-16 10:11 /user/oozie
[phadmin@elephant ~]$ 

```




<code>curl -u admin:admin 'http://localhost:7180/api/v14/hosts'</code>
```aidl
{
  "items" : [ {
    "hostId" : "7554277d-648b-4983-aa64-b96d2461c7f6",
    "ipAddress" : "10.3.4.5",
    "hostname" : "elephant.cdh-bootcamp-phg",
    "rackId" : "/default",
    "hostUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/hostRedirect/7554277d-648b-4983-aa64-b96d2461c7f6",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 4,
    "totalPhysMemBytes" : 29493092352
  }, {
    "hostId" : "432d725d-6783-43a5-92d5-eb317542d899",
    "ipAddress" : "10.3.4.6",
    "hostname" : "horse.cdh-bootcamp-phg",
    "rackId" : "/default",
    "hostUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/hostRedirect/432d725d-6783-43a5-92d5-eb317542d899",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 4,
    "totalPhysMemBytes" : 29493092352
  }, {
    "hostId" : "52a03a71-cabe-4125-b796-fffc1d5e46dd",
    "ipAddress" : "10.3.4.4",
    "hostname" : "lion.cdh-bootcamp-phg",
    "rackId" : "/default",
    "hostUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/hostRedirect/52a03a71-cabe-4125-b796-fffc1d5e46dd",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 4,
    "totalPhysMemBytes" : 29493092352
  }, {
    "hostId" : "6c65985d-fd87-4478-ae3e-ded0dd28ab7d",
    "ipAddress" : "10.3.4.8",
    "hostname" : "monkey.cdh-bootcamp-phg",
    "rackId" : "/default",
    "hostUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/hostRedirect/6c65985d-fd87-4478-ae3e-ded0dd28ab7d",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 4,
    "totalPhysMemBytes" : 29493092352
  }, {
    "hostId" : "ccff6206-387b-45e8-99c2-f21e2423432c",
    "ipAddress" : "10.3.4.7",
    "hostname" : "tiger.cdh-bootcamp-phg",
    "rackId" : "/default",
    "hostUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/hostRedirect/ccff6206-387b-45e8-99c2-f21e2423432c",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "numPhysicalCores" : 4,
    "totalPhysMemBytes" : 29493092352
  } ]
}%           
```

<code>curl -u admin:admin 'http://localhost:7180/api/v8/clusters'</code>
```aidl
➜  ~ curl -u admin:admin 'http://localhost:7180/api/v8/clusters'
{
  "items" : [ {
    "name" : "cluster",
    "displayName" : "phgolardbd",
    "version" : "CDH5",
    "fullVersion" : "5.13.2",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ]
  } ]
}%   
```

<code>curl -u admin:admin 'http://localhost:7180/api/v8/clusters/phgolardbd/services'</code>
```aidl
➜  ~ curl -u admin:admin 'http://localhost:7180/api/v8/clusters/phgolardbd/services'
{
  "items" : [ {
    "name" : "zookeeper",
    "type" : "ZOOKEEPER",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/zookeeper",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "ZOOKEEPER_CANARY_HEALTH",
      "summary" : "GOOD"
    }, {
      "name" : "ZOOKEEPER_SERVERS_HEALTHY",
      "summary" : "GOOD"
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "ZooKeeper"
  }, {
    "name" : "oozie",
    "type" : "OOZIE",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/oozie",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "OOZIE_OOZIE_SERVERS_HEALTHY",
      "summary" : "GOOD"
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "Oozie"
  }, {
    "name" : "hue",
    "type" : "HUE",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/hue",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "HUE_HUE_SERVERS_HEALTHY",
      "summary" : "GOOD"
    }, {
      "name" : "HUE_LOAD_BALANCER_HEALTHY",
      "summary" : "GOOD"
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "Hue"
  }, {
    "name" : "hdfs",
    "type" : "HDFS",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/hdfs",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "HDFS_BLOCKS_WITH_CORRUPT_REPLICAS",
      "summary" : "GOOD"
    }, {
      "name" : "HDFS_CANARY_HEALTH",
      "summary" : "GOOD"
    }, {
      "name" : "HDFS_DATA_NODES_HEALTHY",
      "summary" : "GOOD"
    }, {
      "name" : "HDFS_FREE_SPACE_REMAINING",
      "summary" : "GOOD"
    }, {
      "name" : "HDFS_HA_NAMENODE_HEALTH",
      "summary" : "GOOD"
    }, {
      "name" : "HDFS_MISSING_BLOCKS",
      "summary" : "GOOD"
    }, {
      "name" : "HDFS_UNDER_REPLICATED_BLOCKS",
      "summary" : "GOOD"
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "HDFS"
  }, {
    "name" : "impala",
    "type" : "IMPALA",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/impala",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "IMPALA_ASSIGNMENT_LOCALITY",
      "summary" : "DISABLED"
    }, {
      "name" : "IMPALA_CATALOGSERVER_HEALTH",
      "summary" : "GOOD"
    }, {
      "name" : "IMPALA_IMPALADS_HEALTHY",
      "summary" : "GOOD"
    }, {
      "name" : "IMPALA_STATESTORE_HEALTH",
      "summary" : "GOOD"
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "Impala"
  }, {
    "name" : "yarn",
    "type" : "YARN",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/yarn",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "YARN_JOBHISTORY_HEALTH",
      "summary" : "GOOD"
    }, {
      "name" : "YARN_NODE_MANAGERS_HEALTHY",
      "summary" : "GOOD"
    }, {
      "name" : "YARN_RESOURCEMANAGERS_HEALTH",
      "summary" : "GOOD"
    }, {
      "name" : "YARN_USAGE_AGGREGATION_HEALTH",
      "summary" : "DISABLED"
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "YARN (MR2 Included)"
  }, {
    "name" : "hive",
    "type" : "HIVE",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/hive",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "HIVE_HIVEMETASTORES_HEALTHY",
      "summary" : "GOOD"
    }, {
      "name" : "HIVE_HIVESERVER2S_HEALTHY",
      "summary" : "GOOD"
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "Hive"
  } ]
}%  
```