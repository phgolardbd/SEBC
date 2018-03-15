##pre requisite for the lab

####1 

```aidl
Before you start:

Load sample data for Hive/Impala
Login to HUE using your GitHub name and the password cloudera
The first login to Hue becomes the admin account
Follow the setup wizard to load sample tables for Hive and Impala
You'll need this data to support the Sentry lab
```

####2 Test if JCE is installed
https://blog.puneethabm.com/configure-hadoop-security-with-cloudera-manager-using-kerberos/

Test if JCE is installed
`nano Test.java`
```aidl
import javax.crypto.Cipher;

class Test {
  public static void main(String[] args) {
    try {
      System.out.println("Hello World!");
      int maxKeyLen = Cipher.getMaxAllowedKeyLength("AES");
      System.out.println(maxKeyLen);
    } catch (Exception e){
      System.out.println("Sad world :(");
    }
  }
}
```
```aidl
#!/bin/bash

javac Test.java
java Test
```

####3 Kerberos architecture - set up servers and clients
kerberos server setup : lion (CM server node)
`sudo yum -y install krb5-server krb5-libs krb5-auth-dialog krb5-workstation`
kerberos client setup : all nodes (including CM server)
`sudo yum -y install krb5-workstation krb5-libs krb5-auth-dialog`

####4 kerberos server configuration
```aidl
Server:
–> Change Realm Name > cdh-bootcamp-phg
–> Add parameters > max_life = 1d and max_renewable_life = 7d
```

`sudo nano /var/kerberos/krb5kdc/kdc.conf`
```aidl
[kdcdefaults]
 kdc_ports = 88
 kdc_tcp_ports = 88

[realms]
  CDH.BOOTCAMP.PHG = {
  #master_key_type = aes256-cts
  acl_file = /var/kerberos/krb5kdc/kadm5.acl
  dict_file = /usr/share/dict/words
  admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
  supported_enctypes = aes256-cts:normal aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal des-hmac-sha1:normal des-cbc-md5:normal des-cbc-crc:normal
  max_life = 1d
  max_renewable_life = 7d
 }
```

####5 kerberos client

`sudo nano /etc/krb5.conf`

```aidl
[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log

[libdefaults]
 default_realm = CDH.BOOTCAMP.PHG
 dns_lookup_realm = false
 dns_lookup_kdc = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true
 udp_preference_limit = 1
 default_tgs_enctypes = arcfour-hmac
 default_tkt_enctypes = arcfour-hmac 

[realms] 
  CDH.BOOTCAMP.PHG = {
  kdc = lion.cdh-bootcamp-phg
  admin_server = lion.cdh-bootcamp-phg
 }

[domain_realm]
   .cdh-bootcamp-phg = CDH.BOOTCAMP.PHG
   cdh-bootcamp-phg = CDH.BOOTCAMP.PHG
```

####6 Kerberos server - Create the database using the kdb5_util utility
`sudo /usr/sbin/kdb5_util create -s`

```aidl
 database master key : K/M@CDH.BOOTCAMP.PHG
```

####7 Kerberos server - add cloudera-scm principal, it will be used by Cloudera Manager later to manage Hadoop principals
principal = user
`kadmin.local`
```aidl
kadmin.local:  addprinc cloudera-scm@CDH.BOOTCAMP.PHG
WARNING: no policy specified for cloudera-scm@PUNEETHA.COM; defaulting to no policy
Enter password for principal "cloudera-scm@PUNEETHA.COM": admin
Re-enter password for principal "cloudera-scm@PUNEETHA.COM": admin
Principal "cloudera-scm@CDH.BOOTCAMP.PHG" created.

```
####8 Kerberos server : Add */admin and cloudera-scm to ACL(Access Control List), which gives privilege to add principals for admin and cloudera-scm principal
      
`sudo nano /var/kerberos/krb5kdc/kadm5.acl`
```aidl
*/admin@CDH.BOOTCAMP.PHG *
cloudera-scm@CDH.BOOTCAMP.PHG admilc
```

####9 kerberos server : password policy
`kadmin.local`
```aidl
kadmin.local:  addpol admin
kadmin.local:  addpol users
kadmin.local:  addpol hosts
kadmin.local:  exit
```

####10 Create a file called cmf.principal and add cloudera principal name in that file as shown below and provide appropriate permissions:

`sudo nano /etc/cloudera-scm-server/cmf.principal`
```
cloudera-scm@CDH.BOOTCAMP.PHG
```

`sudo chown cloudera-scm:cloudera-scm /etc/cloudera-scm-server/cmf.principal`

`sudo chmod 600 /etc/cloudera-scm-server/cmf.principal`

afterwards, on all nodes (all clients) do a kinit for your cloudera manager principal
and look at the content of the kinit file (important is the FRI property that stands for Forwardable, Renewable and I...)

kinit cloudera-scm

klist -e -f


####11 Start Kerberos using the following commands:

`sudo service krb5kdc start`

`service kadmin start`
