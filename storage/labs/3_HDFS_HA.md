https://www.cloudera.com/documentation/enterprise/latest/topics/cdh_hag_hdfs_ha_enabling.html#cmug_topic_5_12
actions > enable HA
add a second namenode (elephant and tiger)
add 3 journal namenode (elephant, horse, tiger)
in review changes sections, edit the jn directory adding the following path
/mnt/resource/dfs/jn

create a CM admin user
uname: phgolardbd 
pword: cloudera
+ full administrator
