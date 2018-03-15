#### on all hosts (including the kerberos server)
cloudera-scm is a kerberos principal with super user role

`kinit phgolardbd`
 
`klist -e -f`
 
 ```aidl
Ticket cache: FILE:/tmp/krb5cc_1000
Default principal: phgolardbd@CDH.BOOTCAMP.PHG

Valid starting       Expires              Service principal
2018-03-15 10:55:01  2018-03-16 10:55:01  krbtgt/CDH.BOOTCAMP.PHG@CDH.BOOTCAMP.PHG
	renew until 2018-03-22 10:55:01, Flags: FRI
	Etype (skey, tkt): arcfour-hmac, aes256-cts-hmac-sha1-96 
```

