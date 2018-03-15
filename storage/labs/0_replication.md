
####generate 500 MB with teragen
`sudo -u hdfs hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen 5000000 /user/phgolard`

```aidl
File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=246530
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=167
		HDFS: Number of bytes written=500000000
		HDFS: Number of read operations=8
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=4
	Job Counters 
		Launched map tasks=2
		Other local map tasks=2
		Total time spent by all maps in occupied slots (ms)=17751
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=17751
		Total vcore-seconds taken by all map tasks=17751
		Total megabyte-seconds taken by all map tasks=18177024
	Map-Reduce Framework
		Map input records=5000000
		Map output records=5000000
		Input split bytes=167
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=253
		CPU time spent (ms)=10410
		Physical memory (bytes) snapshot=746594304
		Virtual memory (bytes) snapshot=3155640320
		Total committed heap usage (bytes)=1143472128
	org.apache.hadoop.examples.terasort.TeraGen$Counters
		CHECKSUM=10735710707299981
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=500000000

```

`sudo -u hdfs hdfs dfs -chmod 777 /user/phgolardbd`

