##### create a user on all hosts
`sudo useradd -m phgolardbd`

######create a user directory on hdfs (from one host that has a role in HDFS service)
`sudo -u hdfs hdfs dfs -mkdir -p /user/phgolardbd`

`sudo -u hdfs hdfs dfs -chown training /user/phgolardbd`

`sudo -u phgolardbd time hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen -Dmapred.reduce.tasks=4 -Dmapred.map.tasks=4 -Ddfs.block.size=32000000 10000000 /user/phgolardbd/tera.data`

```aidl
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=493252
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=337
		HDFS: Number of bytes written=1000000000
		HDFS: Number of read operations=16
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=8
	Job Counters 
		Launched map tasks=4
		Other local map tasks=4
		Total time spent by all maps in occupied slots (ms)=33597
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=33597
		Total vcore-seconds taken by all map tasks=33597
		Total megabyte-seconds taken by all map tasks=34403328
	Map-Reduce Framework
		Map input records=10000000
		Map output records=10000000
		Input split bytes=337
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=538
		CPU time spent (ms)=21510
		Physical memory (bytes) snapshot=1486446592
		Virtual memory (bytes) snapshot=6318235648
		Total committed heap usage (bytes)=2282749952
	org.apache.hadoop.examples.terasort.TeraGen$Counters
		CHECKSUM=21472776955442690
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=1000000000
5.15user 0.48system 0:20.57elapsed 27%CPU (0avgtext+0avgdata 237236maxresident)k
0inputs+1864outputs (0major+69787minor)pagefaults 0swaps

```
#####terasort
`sudo -u phgolardbd time  hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /user/phgolardbd/tera.data /user/phgolardbd/terasort.data`

```aidl
File System Counters
		FILE: Number of bytes read=439892250
		FILE: Number of bytes written=878996156
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1000004512
		HDFS: Number of bytes written=1000000000
		HDFS: Number of read operations=120
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=16
	Job Counters 
		Launched map tasks=32
		Launched reduce tasks=8
		Data-local map tasks=31
		Rack-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=225617
		Total time spent by all reduces in occupied slots (ms)=69342
		Total time spent by all map tasks (ms)=225617
		Total time spent by all reduce tasks (ms)=69342
		Total vcore-seconds taken by all map tasks=225617
		Total vcore-seconds taken by all reduce tasks=69342
		Total megabyte-seconds taken by all map tasks=231031808
		Total megabyte-seconds taken by all reduce tasks=71006208
	Map-Reduce Framework
		Map input records=10000000
		Map output records=10000000
		Map output bytes=1020000000
		Map output materialized bytes=434111372
		Input split bytes=4512
		Combine input records=0
		Combine output records=0
		Reduce input groups=10000000
		Reduce shuffle bytes=434111372
		Reduce input records=10000000
		Reduce output records=10000000
		Spilled Records=20000000
		Shuffled Maps =256
		Failed Shuffles=0
		Merged Map outputs=256
		GC time elapsed (ms)=9892
		CPU time spent (ms)=130740
		Physical memory (bytes) snapshot=20303405056
		Virtual memory (bytes) snapshot=63384875008
		Total committed heap usage (bytes)=27211595776
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=1000000000
	File Output Format Counters 
		Bytes Written=1000000000
18/03/15 05:46:52 INFO terasort.TeraSort: done
6.73user 0.54system 0:42.85elapsed 16%CPU (0avgtext+0avgdata 253648maxresident)k
0inputs+1864outputs (0major+74188minor)pagefaults 0swaps
```
