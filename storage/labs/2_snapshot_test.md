### downloads + scp the SEBC.zip file to elephant tmp directory
`scp SEBC.zip phadmin@52.138.136.107:/tmp/`

### create a precious directory on hdfs (on one host with HDFS role)
sudo -u hdfs hdfs dfs -mkdir -p /precious
sudo -u hdfs hdfs dfs -put /tmp/SEBC.zip /precious/
sudo -u hdfs hdfs dfsadmin -allowSnapshot /precious
sudo -u hdfs hdfs dfs -createSnapshot /precious sebc-hdfs-snapshot
sudo -u hdfs hdfs dfs -rm -R /precious

rm: Failed to move to trash: hdfs://elephant.cdh-bootcamp-phg:8020/precious: The directory /precious cannot be deleted since /precious is snapshottable and already has snapshots

sudo -u hdfs hdfs dfs -rm /precious/SEBC.zip
sudo -u hdfs hdfs dfs -cp /precious/.snapshot/sebc-hdfs-snapshot/SEBC.zip /precious/

NB ask the teacher about
showing hidden files in hue
namenode web UI port issue
replica mysql