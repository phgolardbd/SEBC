```aidl
[phadmin@elephant ~]$ sudo su - hilary
[hilary@elephant ~]$ time hadoop jar /opt/cloudera/parcels/CDH-5.13.2-1.cdh5.13.2.p0.3/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen -Dmapred.reduce.tasks=16 -Dmapreduce.map.memory.mb=768 -Dmapreduce.reduce.memory.mb=768 -Ddfs.blocksize=64000000 65536 /user/hilary/tgen
18/03/16 10:40:28 INFO client.RMProxy: Connecting to ResourceManager at horse.cdh-bootcamp-phg/10.3.4.6:8032
18/03/16 10:40:29 INFO terasort.TeraGen: Generating 65536 using 16
18/03/16 10:40:29 INFO mapreduce.JobSubmitter: number of splits:16
18/03/16 10:40:29 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
18/03/16 10:40:29 INFO Configuration.deprecation: mapred.reduce.tasks is deprecated. Instead, use mapreduce.job.reduces
18/03/16 10:40:29 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1521195347957_0001
18/03/16 10:40:30 INFO impl.YarnClientImpl: Submitted application application_1521195347957_0001
18/03/16 10:40:30 INFO mapreduce.Job: The url to track the job: http://horse.cdh-bootcamp-phg:8088/proxy/application_1521195347957_0001/
18/03/16 10:40:30 INFO mapreduce.Job: Running job: job_1521195347957_0001
18/03/16 10:40:37 INFO mapreduce.Job: Job job_1521195347957_0001 running in uber mode : false
18/03/16 10:40:37 INFO mapreduce.Job:  map 0% reduce 0%
18/03/16 10:40:43 INFO mapreduce.Job:  map 13% reduce 0%
18/03/16 10:40:45 INFO mapreduce.Job:  map 31% reduce 0%
18/03/16 10:40:46 INFO mapreduce.Job:  map 44% reduce 0%
18/03/16 10:40:47 INFO mapreduce.Job:  map 81% reduce 0%
18/03/16 10:40:48 INFO mapreduce.Job:  map 94% reduce 0%
18/03/16 10:40:50 INFO mapreduce.Job:  map 100% reduce 0%
18/03/16 10:40:50 INFO mapreduce.Job: Job job_1521195347957_0001 completed successfully
18/03/16 10:40:50 INFO mapreduce.Job: Counters: 31
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=2362550
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1326
		HDFS: Number of bytes written=6553600
		HDFS: Number of read operations=64
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=32
	Job Counters 
		Launched map tasks=16
		Other local map tasks=16
		Total time spent by all maps in occupied slots (ms)=91326
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=91326
		Total vcore-milliseconds taken by all map tasks=91326
		Total megabyte-milliseconds taken by all map tasks=93517824
	Map-Reduce Framework
		Map input records=65536
		Map output records=65536
		Input split bytes=1326
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=752
		CPU time spent (ms)=11040
		Physical memory (bytes) snapshot=3768381440
		Virtual memory (bytes) snapshot=21700960256
		Total committed heap usage (bytes)=7319060480
	org.apache.hadoop.examples.terasort.TeraGen$Counters
		CHECKSUM=140678493208567
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=6553600

real	0m24.716s
user	0m5.112s
sys	0m0.436s

```

```aidl
[hilary@elephant ~]$ hdfs dfs -ls /user/hilary/tgen
Found 17 items
-rw-r--r--   3 hilary hilary          0 2018-03-16 10:40 /user/hilary/tgen/_SUCCESS
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00000
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00001
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00002
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00003
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00004
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00005
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00006
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00007
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00008
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00009
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00010
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00011
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00012
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00013
-rw-r--r--   3 hilary hilary     409600 2018-03-16 10:40 /user/hilary/tgen/part-m-00014

```

```aidl
[hilary@elephant ~]$ hadoop fsck -blocks /user/hilary
DEPRECATED: Use of this script to execute hdfs command is deprecated.
Instead use the hdfs command for it.

Connecting to namenode via http://elephant.cdh-bootcamp-phg:50070/fsck?ugi=hilary&blocks=1&path=%2Fuser%2Fhilary
FSCK started by hilary (auth:SIMPLE) from /10.3.4.5 for path /user/hilary at Fri Mar 16 10:45:02 UTC 2018
.................Status: HEALTHY
 Total size:	6553600 B
 Total dirs:	3
 Total files:	17
 Total symlinks:		0
 Total blocks (validated):	16 (avg. block size 409600 B)
 Minimally replicated blocks:	16 (100.0 %)
 Over-replicated blocks:	0 (0.0 %)
 Under-replicated blocks:	0 (0.0 %)
 Mis-replicated blocks:		0 (0.0 %)
 Default replication factor:	3
 Average block replication:	3.0
 Corrupt blocks:		0
 Missing replicas:		0 (0.0 %)
 Number of data-nodes:		4
 Number of racks:		1
FSCK ended at Fri Mar 16 10:45:02 UTC 2018 in 7 milliseconds


The filesystem under path '/user/hilary' is HEALTHY

```