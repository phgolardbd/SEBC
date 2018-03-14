####upgrade CM
#####version
`curl -u admin:admin 'http://localhost:7180/api/version' 
```aidl
v19% 
````
####CM version
`curl -u admin:admin 'http://localhost:7180/api/v19/cm/version'`

```aidl
{
  "version" : "5.14.1",
  "buildUser" : "jenkins",
  "buildTimestamp" : "20180207-1728",
  "gitHash" : "f253d8e2b9cf5cb61a2f1ba1bf71de6fb603add0",
  "snapshot" : false
}% 
```
####CM users
`curl -u admin:admin 'http://localhost:7180/api/v19/users'`
```aidl
{
  "items" : [ {
    "name" : "admin",
    "roles" : [ "ROLE_ADMIN" ]
  }, {
    "name" : "minotaur",
    "roles" : [ "ROLE_CONFIGURATOR" ]
  } ]
}%
```
####CM db server type
`curl -u admin:admin 'http://localhost:7180/api/v19/cm/scmDbInfo'`
```aidl
{
  "scmDbType" : "MYSQL",
  "embeddedDbUsed" : false
}%
```