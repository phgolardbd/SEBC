#####cloud provider

`Azure`

####listing the nodes (public static ip adresses, FQDN, short hostname)
```aidl
[phadmin@elephant ~]$ getent hosts
127.0.0.1       localhost localhost.localdomain localhost4 localhost4.localdomain4
127.0.0.1       localhost localhost.localdomain localhost6 localhost6.localdomain6
10.3.4.5        elephant.cdh-bootcamp-phg elephant
10.3.4.4        lion.cdh-bootcamp-phg lion
10.3.4.6        horse.cdh-bootcamp-phg horse
10.3.4.7        tiger.cdh-bootcamp-phg tiger
10.3.4.8        monkey.cdh-bootcamp-phg monkey

```

####system capacity of the first node (elephant)


```aidl
[phadmin@elephant ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2        32G  2,6G   29G   9% /
devtmpfs         14G     0   14G   0% /dev
tmpfs            14G     0   14G   0% /dev/shm
tmpfs            14G  8,4M   14G   1% /run
tmpfs            14G     0   14G   0% /sys/fs/cgroup
/dev/sda1       497M  103M  394M  21% /boot
/dev/sdb1        55G  2,1G   51G   4% /mnt/resource
tmpfs           2,8G     0  2,8G   0% /run/user/1000
[phadmin@elephant ~]$ free -m
              total        used        free      shared  buff/cache   available
Mem:          28126         322       27598           8         205       27460
Swap:          2047           0        2047
[phadmin@elephant ~]$ 
```


####linux version

```aidl
[phadmin@elephant ~]$ cat /etc/*-release
NAME="Red Hat Enterprise Linux Server"
VERSION="7.4 (Maipo)"
ID="rhel"
ID_LIKE="fedora"
VARIANT="Server"
VARIANT_ID="server"
VERSION_ID="7.4"
PRETTY_NAME="Red Hat Enterprise Linux Server 7.4 (Maipo)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:redhat:enterprise_linux:7.4:GA:server"
HOME_URL="https://www.redhat.com/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"

REDHAT_BUGZILLA_PRODUCT="Red Hat Enterprise Linux 7"
REDHAT_BUGZILLA_PRODUCT_VERSION=7.4
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux"
REDHAT_SUPPORT_PRODUCT_VERSION="7.4"
Red Hat Enterprise Linux Server release 7.4 (Maipo)
Red Hat Enterprise Linux Server release 7.4 (Maipo)
[phadmin@elephant ~]$ 

```

####repo list eneabled

```aidl
[phadmin@elephant ~]$ yum repolist enabled
Loaded plugins: langpacks, product-id, search-disabled-repos
Repo rhui-rhel-7-server-dotnet-rhui-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-dotnet-rhui-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-dotnet-rhui-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-dotnet-rhui-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-dotnet-rhui-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-dotnet-rhui-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-extras-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-extras-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-extras-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-extras-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-extras-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-extras-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-optional-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-optional-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-optional-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-optional-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-optional-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-optional-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-rh-common-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-rh-common-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-rh-common-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-rh-common-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-rh-common-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-rh-common-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-supplementary-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-supplementary-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-supplementary-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-supplementary-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-7-server-rhui-supplementary-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-7-server-rhui-supplementary-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-server-rhui-rhscl-7-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-server-rhui-rhscl-7-debug-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-server-rhui-rhscl-7-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-server-rhui-rhscl-7-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
Repo rhui-rhel-server-rhui-rhscl-7-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/product/content.crt
Repo rhui-rhel-server-rhui-rhscl-7-source-rpms forced skip_if_unavailable=True due to: /etc/pki/rhui/key.pem
repo id                                                                                 repo name                                                                                                      status
epel/x86_64                                                                             Extra Packages for Enterprise Linux 7 - x86_64                                                                 12.401
mariadb                                                                                 MariaDB                                                                                                            17
rhui-microsoft-azure-rhel7                                                              Microsoft Azure RPMs for Red Hat Enterprise Linux 7                                                                 2
!rhui-rhel-7-server-dotnet-rhui-debug-rpms/7Server/x86_64                               dotNET on RHEL Debug RPMs for Red Hat Enterprise Linux 7 Server from RHUI                                          33
!rhui-rhel-7-server-dotnet-rhui-rpms/7Server/x86_64                                     dotNET on RHEL RPMs for Red Hat Enterprise Linux 7 Server from RHUI                                                75
!rhui-rhel-7-server-dotnet-rhui-source-rpms/7Server/x86_64                              dotNET on RHEL Source RPMs for Red Hat Enterprise Linux 7 Server from RHUI                                         38
!rhui-rhel-7-server-rhui-debug-rpms/7Server/x86_64                                      Red Hat Enterprise Linux 7 Server from RHUI (Debug RPMs)                                                        6.503
!rhui-rhel-7-server-rhui-extras-debug-rpms/x86_64                                       Red Hat Enterprise Linux 7 Server - Extras from RHUI (Debug RPMs)                                                 145
!rhui-rhel-7-server-rhui-extras-rpms/x86_64                                             Red Hat Enterprise Linux 7 Server - Extras from RHUI (RPMs)                                                       778
!rhui-rhel-7-server-rhui-extras-source-rpms/x86_64                                      Red Hat Enterprise Linux 7 Server - Extras from RHUI (Source RPMs)                                                307
!rhui-rhel-7-server-rhui-optional-debug-rpms/7Server/x86_64                             Red Hat Enterprise Linux 7 Server - Optional from RHUI (Debug RPMs)                                             4.363
!rhui-rhel-7-server-rhui-optional-rpms/7Server/x86_64                                   Red Hat Enterprise Linux 7 Server - Optional from RHUI (RPMs)                                                  13.444
!rhui-rhel-7-server-rhui-optional-source-rpms/7Server/x86_64                            Red Hat Enterprise Linux 7 Server - Optional from RHUI (Source RPMs)                                            3.045
!rhui-rhel-7-server-rhui-rh-common-debug-rpms/7Server/x86_64                            Red Hat Enterprise Linux 7 Server - RH Common from RHUI (Debug RPMs)                                               32
!rhui-rhel-7-server-rhui-rh-common-rpms/7Server/x86_64                                  Red Hat Enterprise Linux 7 Server - RH Common from RHUI (RPMs)                                                    231
!rhui-rhel-7-server-rhui-rh-common-source-rpms/7Server/x86_64                           Red Hat Enterprise Linux 7 Server - RH Common from RHUI (Source RPMs)                                              90
!rhui-rhel-7-server-rhui-rpms/7Server/x86_64                                            Red Hat Enterprise Linux 7 Server from RHUI (RPMs)                                                             18.257
!rhui-rhel-7-server-rhui-source-rpms/7Server/x86_64                                     Red Hat Enterprise Linux 7 Server from RHUI (Source RPMs)                                                       5.264
!rhui-rhel-7-server-rhui-supplementary-debug-rpms/7Server/x86_64                        Red Hat Enterprise Linux 7 Server - Supplementary from RHUI (Debug RPMs)                                            0
!rhui-rhel-7-server-rhui-supplementary-rpms/7Server/x86_64                              Red Hat Enterprise Linux 7 Server - Supplementary from RHUI (RPMs)                                                254
!rhui-rhel-7-server-rhui-supplementary-source-rpms/7Server/x86_64                       Red Hat Enterprise Linux 7 Server - Supplementary from RHUI (Source RPMs)                                           8
!rhui-rhel-server-rhui-rhscl-7-debug-rpms/7Server/x86_64                                Red Hat Software Collections Debug RPMs for Red Hat Enterprise Linux 7 Server from RHUI                           580
!rhui-rhel-server-rhui-rhscl-7-rpms/7Server/x86_64                                      Red Hat Software Collections RPMs for Red Hat Enterprise Linux 7 Server from RHUI                               9.336
!rhui-rhel-server-rhui-rhscl-7-source-rpms/7Server/x86_64                               Red Hat Software Collections Source RPMs for Red Hat Enterprise Linux 7 Server from RHUI                        3.856
repolist: 79.059

```

### /etc/passwd for hilary and anupam
```aidl
hilary:x:2800:1002::/home/hilary:/bin/bash
anupam:x:2900:1001::/home/anupam:/bin/bash
```

### /etc/group
````aidl
analytics:x:1001:
datasci:x:1002:
````
