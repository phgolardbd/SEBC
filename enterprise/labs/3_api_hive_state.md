#### check the current hive service status
`curl -u admin:admin 'http://localhost:7180/api/v10/clusters/phgolardbd/services/hive'`
```aidl
{
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
}% 
```

#### stop hive service
`curl -X POST -u admin:admin 'http://localhost:7180/api/v1/clusters/phgolardbd/services/hive/commands/stop'
```aidl
{
  "id" : 174,
  "name" : "Stop",
  "startTime" : "2018-03-14T09:45:01.373Z",
  "active" : true,
  "serviceRef" : {
    "clusterName" : "cluster",
    "serviceName" : "hive"
  }
}% 

````
#### check the current hive service status
`curl -u admin:admin 'http://localhost:7180/api/v10/clusters/phgolardbd/services/hive'`
```aidl
{
  "name" : "hive",
  "type" : "HIVE",
  "clusterRef" : {
    "clusterName" : "cluster"
  },
  "serviceUrl" : "http://lion.cdh-bootcamp-phg:7180/cmf/serviceRedirect/hive",
  "serviceState" : "STOPPED",
  "healthSummary" : "DISABLED",
  "healthChecks" : [ {
    "name" : "HIVE_HIVEMETASTORES_HEALTHY",
    "summary" : "DISABLED"
  }, {
    "name" : "HIVE_HIVESERVER2S_HEALTHY",
    "summary" : "DISABLED"
  } ],
  "configStalenessStatus" : "FRESH",
  "clientConfigStalenessStatus" : "FRESH",
  "maintenanceMode" : false,
  "maintenanceOwners" : [ ],
  "displayName" : "Hive"
}% 
```
#### starting hive service
`curl -X POST -u admin:admin 'http://localhost:7180/api/v1/clusters/phgolardbd/services/hive/commands/start'`
