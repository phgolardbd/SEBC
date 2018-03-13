sudo groupadd cdh_bootcamp
sudo useradd -m phgolardbd

sudo usermod -aG cdh_bootcamp phgolardbd

sudo -u hdfs hdfs dfs -mkdir -p /user/phgolardbd/
sudo -u hdfs hdfs dfs -chown phgolardbd /user/phgolardbd

sudo -u hdfs hdfs dfs -setfacl -R -m default:group:cdh_bootcamp:rwx /user/phgolardbd
sudo -u hdfs hdfs dfs -setfacl -R -m group:cdh_bootcamp:rwx /user/phgolardbd

sudo -u hdfs hdfs dfs -setfacl -R -m default:group:hadoop:rwx /user/phgolardbd
sudo -u hdfs hdfs dfs -setfacl -R -m group:hadoop:rwx /user/phgolardbd


sudo -u hdfs hdfs dfs -getfacl /user/phgolardbd

