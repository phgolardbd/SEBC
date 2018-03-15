
Rest call to get the deployment (with port forwarding)

`for documentation on the api see on Cm support < api documentation`

<code> curl -u admin:admin 'http://localhost:7180/api/v2/cm/deployment'</code>

Results

```aidl
{
  "timestamp" : "2018-03-14T09:21:37.022Z",
  "clusters" : [ {
    "name" : "phgolardbd",
    "version" : "CDH5",
    "services" : [ {
      "name" : "zookeeper",
      "type" : "ZOOKEEPER",
      "config" : {
        "roleTypeConfigs" : [ ],
        "items" : [ ]
      },
      "roles" : [ {
        "name" : "zookeeper-SERVER-4b6f106390170c84ccb085e6af9bc039",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "8403e20e-a5c8-4189-a0c7-6466646f5841"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "edahcyu3lx1oetfeou5ei5cun"
          }, {
            "name" : "serverId",
            "value" : "3"
          } ]
        }
      }, {
        "name" : "zookeeper-SERVER-57781b87b7204030f2b2355c6aaec056",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "33nkjx0wz3rlizgfn75amimg5"
          }, {
            "name" : "serverId",
            "value" : "2"
          } ]
        }
      }, {
        "name" : "zookeeper-SERVER-5c5934a1d03af626009a0be9c40aeded",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "40afb76e-e703-46d3-85ed-9903e5df3fa9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "e71d8k676htj75h0obao03bey"
          }, {
            "name" : "serverId",
            "value" : "1"
          } ]
        }
      } ],
      "displayName" : "ZooKeeper"
    }, {
      "name" : "oozie",
      "type" : "OOZIE",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "OOZIE_SERVER",
          "items" : [ {
            "name" : "oozie_database_host",
            "value" : "lion.cdh-bootcamp-phg"
          }, {
            "name" : "oozie_database_password",
            "value" : "password"
          }, {
            "name" : "oozie_database_type",
            "value" : "mysql"
          }, {
            "name" : "oozie_database_user",
            "value" : "oozieuser"
          } ]
        } ],
        "items" : [ {
          "name" : "hive_service",
          "value" : "hive"
        }, {
          "name" : "mapreduce_yarn_service",
          "value" : "yarn"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "oozie-OOZIE_SERVER-6cd7f3af59143fc7cb1d79643fc86abd",
        "type" : "OOZIE_SERVER",
        "hostRef" : {
          "hostId" : "b94e86a4-f1a1-4c8b-aeba-d6d5580a27fa"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "apkvawir7pvnl49hvjiv19vvl"
          } ]
        }
      } ],
      "displayName" : "Oozie"
    }, {
      "name" : "hue",
      "type" : "HUE",
      "config" : {
        "roleTypeConfigs" : [ ],
        "items" : [ {
          "name" : "database_host",
          "value" : "lion.cdh-bootcamp-phg"
        }, {
          "name" : "database_password",
          "value" : "password"
        }, {
          "name" : "database_type",
          "value" : "mysql"
        }, {
          "name" : "database_user",
          "value" : "hueuser"
        }, {
          "name" : "hive_service",
          "value" : "hive"
        }, {
          "name" : "hue_webhdfs",
          "value" : "hdfs-NAMENODE-57781b87b7204030f2b2355c6aaec056"
        }, {
          "name" : "oozie_service",
          "value" : "oozie"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hue-HUE_SERVER-6cd7f3af59143fc7cb1d79643fc86abd",
        "type" : "HUE_SERVER",
        "hostRef" : {
          "hostId" : "b94e86a4-f1a1-4c8b-aeba-d6d5580a27fa"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "1wf0w0u16qp925niv2siiy40l"
          }, {
            "name" : "secret_key",
            "value" : "AQNxYPqJ1OINLEZHLMz3CSiUg02qnu"
          } ]
        }
      } ],
      "displayName" : "Hue"
    }, {
      "name" : "hdfs",
      "type" : "HDFS",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "DATANODE",
          "items" : [ {
            "name" : "dfs_data_dir_list",
            "value" : "/mnt/resource/dfs/dn"
          } ]
        }, {
          "roleType" : "GATEWAY",
          "items" : [ {
            "name" : "dfs_client_use_trash",
            "value" : "true"
          } ]
        }, {
          "roleType" : "NAMENODE",
          "items" : [ {
            "name" : "dfs_name_dir_list",
            "value" : "/mnt/resource/dfs/nn"
          }, {
            "name" : "dfs_namenode_servicerpc_address",
            "value" : "8022"
          } ]
        }, {
          "roleType" : "SECONDARYNAMENODE",
          "items" : [ {
            "name" : "fs_checkpoint_dir_list",
            "value" : "/mnt/resource/dfs/snn"
          } ]
        } ],
        "items" : [ {
          "name" : "dfs_ha_fencing_cloudera_manager_secret_key",
          "value" : "NnypamXjKyia0DjLrtVCLT82y5xClo"
        }, {
          "name" : "fc_authorization_secret_key",
          "value" : "eY7rY45vgG4eBxbJB5tIlAxKodZuFm"
        }, {
          "name" : "http_auth_signature_secret",
          "value" : "XurXKK86Sf0ZY2j9mebN4bx6ymNZ67"
        }, {
          "name" : "rm_dirty",
          "value" : "true"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hdfs-BALANCER-4b6f106390170c84ccb085e6af9bc039",
        "type" : "BALANCER",
        "hostRef" : {
          "hostId" : "8403e20e-a5c8-4189-a0c7-6466646f5841"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hdfs-DATANODE-4b6f106390170c84ccb085e6af9bc039",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "8403e20e-a5c8-4189-a0c7-6466646f5841"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "ec6tz7dr5pc7z4p4fo3ezsxjb"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-57781b87b7204030f2b2355c6aaec056",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "8xkvaiiofyz6o54bjeg3bgwbf"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-5c5934a1d03af626009a0be9c40aeded",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "40afb76e-e703-46d3-85ed-9903e5df3fa9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "c28pm0sbz6ozsmvbztzn5urnb"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-6cd7f3af59143fc7cb1d79643fc86abd",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "b94e86a4-f1a1-4c8b-aeba-d6d5580a27fa"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "6i918rd8qqpvhwznj7vic0ede"
          } ]
        }
      }, {
        "name" : "hdfs-NAMENODE-57781b87b7204030f2b2355c6aaec056",
        "type" : "NAMENODE",
        "hostRef" : {
          "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac"
        },
        "config" : {
          "items" : [ {
            "name" : "namenode_id",
            "value" : "44"
          }, {
            "name" : "role_jceks_password",
            "value" : "l61argamg1yq4lg41y2qr6ni"
          } ]
        }
      }, {
        "name" : "hdfs-SECONDARYNAMENODE-5c5934a1d03af626009a0be9c40aeded",
        "type" : "SECONDARYNAMENODE",
        "hostRef" : {
          "hostId" : "40afb76e-e703-46d3-85ed-9903e5df3fa9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "241e4uyyy7yb5ooll8lwaen2n"
          } ]
        }
      } ],
      "displayName" : "HDFS"
    }, {
      "name" : "yarn",
      "type" : "YARN",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "GATEWAY",
          "items" : [ {
            "name" : "mapred_reduce_tasks",
            "value" : "8"
          }, {
            "name" : "mapred_submit_replication",
            "value" : "2"
          } ]
        }, {
          "roleType" : "NODEMANAGER",
          "items" : [ {
            "name" : "yarn_nodemanager_heartbeat_interval_ms",
            "value" : "100"
          }, {
            "name" : "yarn_nodemanager_local_dirs",
            "value" : "/mnt/resource/yarn/nm"
          }, {
            "name" : "yarn_nodemanager_log_dirs",
            "value" : "/mnt/resource/yarn/container-logs"
          }, {
            "name" : "yarn_nodemanager_resource_cpu_vcores",
            "value" : "4"
          }, {
            "name" : "yarn_nodemanager_resource_memory_mb",
            "value" : "12824"
          } ]
        }, {
          "roleType" : "RESOURCEMANAGER",
          "items" : [ {
            "name" : "yarn_scheduler_maximum_allocation_mb",
            "value" : "12824"
          }, {
            "name" : "yarn_scheduler_maximum_allocation_vcores",
            "value" : "4"
          } ]
        } ],
        "items" : [ {
          "name" : "hdfs_service",
          "value" : "hdfs"
        }, {
          "name" : "rm_dirty",
          "value" : "true"
        }, {
          "name" : "zk_authorization_secret_key",
          "value" : "9M77hIFQquom67FGh7V2ZLZB0nQxZD"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "yarn-JOBHISTORY-6cd7f3af59143fc7cb1d79643fc86abd",
        "type" : "JOBHISTORY",
        "hostRef" : {
          "hostId" : "b94e86a4-f1a1-4c8b-aeba-d6d5580a27fa"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "2danv9l7ixtzyfm8gimnr1q6q"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-4b6f106390170c84ccb085e6af9bc039",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "8403e20e-a5c8-4189-a0c7-6466646f5841"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "amicf9rc3qqp6snkfrmku2us7"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-57781b87b7204030f2b2355c6aaec056",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "9hqawny5icc2wvjn9inoq4raj"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-5c5934a1d03af626009a0be9c40aeded",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "40afb76e-e703-46d3-85ed-9903e5df3fa9"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "h4od93umyf5raxp4grj8yztp"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-6cd7f3af59143fc7cb1d79643fc86abd",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "b94e86a4-f1a1-4c8b-aeba-d6d5580a27fa"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "f5fhvqjtivfi9ms7r5bfyme8t"
          } ]
        }
      }, {
        "name" : "yarn-RESOURCEMANAGER-4b6f106390170c84ccb085e6af9bc039",
        "type" : "RESOURCEMANAGER",
        "hostRef" : {
          "hostId" : "8403e20e-a5c8-4189-a0c7-6466646f5841"
        },
        "config" : {
          "items" : [ {
            "name" : "rm_id",
            "value" : "51"
          }, {
            "name" : "role_jceks_password",
            "value" : "8rhtqn3iqeh9280xxyg3afrgm"
          } ]
        }
      } ],
      "displayName" : "YARN (MR2 Included)"
    }, {
      "name" : "hive",
      "type" : "HIVE",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "HIVEMETASTORE",
          "items" : [ {
            "name" : "hive_metastore_java_heapsize",
            "value" : "2985295872"
          }, {
            "name" : "hive_metastore_server_max_message_size",
            "value" : "298529587"
          } ]
        }, {
          "roleType" : "HIVESERVER2",
          "items" : [ {
            "name" : "hiveserver2_java_heapsize",
            "value" : "2985295872"
          }, {
            "name" : "hiveserver2_spark_driver_memory",
            "value" : "966367641"
          }, {
            "name" : "hiveserver2_spark_executor_cores",
            "value" : "4"
          }, {
            "name" : "hiveserver2_spark_executor_memory",
            "value" : "3298662809"
          }, {
            "name" : "hiveserver2_spark_yarn_driver_memory_overhead",
            "value" : "102"
          }, {
            "name" : "hiveserver2_spark_yarn_executor_memory_overhead",
            "value" : "555"
          } ]
        } ],
        "items" : [ {
          "name" : "hive_metastore_database_host",
          "value" : "lion.cdh-bootcamp-phg"
        }, {
          "name" : "hive_metastore_database_password",
          "value" : "password"
        }, {
          "name" : "hive_metastore_database_user",
          "value" : "hiveuser"
        }, {
          "name" : "mapreduce_yarn_service",
          "value" : "yarn"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hive-GATEWAY-57781b87b7204030f2b2355c6aaec056",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-HIVEMETASTORE-57781b87b7204030f2b2355c6aaec056",
        "type" : "HIVEMETASTORE",
        "hostRef" : {
          "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "e0q2u3ngzqq22sv2x7rd023lp"
          } ]
        }
      }, {
        "name" : "hive-HIVESERVER2-57781b87b7204030f2b2355c6aaec056",
        "type" : "HIVESERVER2",
        "hostRef" : {
          "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "bl78ypws5k723xb0yxazud3hv"
          } ]
        }
      } ],
      "displayName" : "Hive"
    } ]
  } ],
  "hosts" : [ {
    "hostId" : "7b072b86-b971-4d21-9c22-39227cc4f4ac",
    "ipAddress" : "10.3.9.5",
    "hostname" : "elephant.cdh-bootcamp-phg",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "8403e20e-a5c8-4189-a0c7-6466646f5841",
    "ipAddress" : "10.3.9.6",
    "hostname" : "horse.cdh-bootcamp-phg",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "544af6f5-b3ea-46b6-8174-435ecec6fd98",
    "ipAddress" : "10.3.9.4",
    "hostname" : "lion.cdh-bootcamp-phg",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "b94e86a4-f1a1-4c8b-aeba-d6d5580a27fa",
    "ipAddress" : "10.3.9.8",
    "hostname" : "monkey.cdh-bootcamp-phg",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "40afb76e-e703-46d3-85ed-9903e5df3fa9",
    "ipAddress" : "10.3.9.7",
    "hostname" : "tiger.cdh-bootcamp-phg",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  } ],
  "users" : [ {
    "name" : "__cloudera_internal_user__mgmt-ACTIVITYMONITOR-50ccc2a9d514bbca1e9edd184951bfb9",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "5fcf92d65b56336a3c53d2f9f8c58238e728a2ed90912b5388f5e082ca8792ae",
    "pwSalt" : 2689979412380608006,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-EVENTSERVER-50ccc2a9d514bbca1e9edd184951bfb9",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "c7f1170df9d8db14923ad80b31de5cfa3fc68e2211bd9b9298e76736ab21015d",
    "pwSalt" : -206628460323061815,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-HOSTMONITOR-50ccc2a9d514bbca1e9edd184951bfb9",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "1730f9ca4f74b2a786f3d0fa2fecdedf5f3bfc15a665d9509774f1524e5af89d",
    "pwSalt" : -7488226596025179382,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-REPORTSMANAGER-50ccc2a9d514bbca1e9edd184951bfb9",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "af7196e8bdbf4a75e248b1906ca443c0704571e39a0664633ea2b25e2c818c70",
    "pwSalt" : 4666679549598124287,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-SERVICEMONITOR-50ccc2a9d514bbca1e9edd184951bfb9",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "ed8b749e07993226f7c4d87560bb810b783971268b4667361d89a4d00466bdfc",
    "pwSalt" : 743711595581864060,
    "pwLogin" : true
  }, {
    "name" : "admin",
    "roles" : [ "ROLE_ADMIN" ],
    "pwHash" : "99a06cdf31a1912e1f7ed8eb68d220d8c8e8e0613e218a12c9ec7c68b2feccb3",
    "pwSalt" : 1645567676863519401,
    "pwLogin" : true
  }, {
    "name" : "minotaur",
    "roles" : [ "ROLE_CONFIGURATOR" ],
    "pwHash" : "9cdac07141ee5b29a3f3cae8c95c6040a2d17ac44ec12fa16efef3be469a4614",
    "pwSalt" : 5051913521325037824,
    "pwLogin" : true
  } ],
  "versionInfo" : {
    "version" : "5.9.3",
    "buildUser" : "jenkins",
    "buildTimestamp" : "20170627-1506",
    "gitHash" : "23506bb4e114dd460bdac64c57a672e6be631907",
    "snapshot" : false
  },
  "managementService" : {
    "name" : "mgmt",
    "type" : "MGMT",
    "config" : {
      "roleTypeConfigs" : [ {
        "roleType" : "ACTIVITYMONITOR",
        "items" : [ {
          "name" : "firehose_database_host",
          "value" : "lion.cdh-bootcamp-phg"
        }, {
          "name" : "firehose_database_name",
          "value" : "amon"
        }, {
          "name" : "firehose_database_password",
          "value" : "password"
        }, {
          "name" : "firehose_database_user",
          "value" : "amonuser"
        } ]
      }, {
        "roleType" : "HOSTMONITOR",
        "items" : [ {
          "name" : "firehose_non_java_memory_bytes",
          "value" : "1610612736"
        } ]
      }, {
        "roleType" : "REPORTSMANAGER",
        "items" : [ {
          "name" : "headlamp_database_host",
          "value" : "lion.cdh-bootcamp-phg"
        }, {
          "name" : "headlamp_database_name",
          "value" : "rman"
        }, {
          "name" : "headlamp_database_password",
          "value" : "password"
        }, {
          "name" : "headlamp_database_user",
          "value" : "rmanuser"
        } ]
      }, {
        "roleType" : "SERVICEMONITOR",
        "items" : [ {
          "name" : "firehose_non_java_memory_bytes",
          "value" : "1610612736"
        } ]
      } ],
      "items" : [ ]
    },
    "roles" : [ {
      "name" : "mgmt-ACTIVITYMONITOR-50ccc2a9d514bbca1e9edd184951bfb9",
      "type" : "ACTIVITYMONITOR",
      "hostRef" : {
        "hostId" : "544af6f5-b3ea-46b6-8174-435ecec6fd98"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "68xcannsja3opvq92q9uksnad"
        } ]
      }
    }, {
      "name" : "mgmt-ALERTPUBLISHER-50ccc2a9d514bbca1e9edd184951bfb9",
      "type" : "ALERTPUBLISHER",
      "hostRef" : {
        "hostId" : "544af6f5-b3ea-46b6-8174-435ecec6fd98"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "94bar1l346p6sv0zmdirjri79"
        } ]
      }
    }, {
      "name" : "mgmt-EVENTSERVER-50ccc2a9d514bbca1e9edd184951bfb9",
      "type" : "EVENTSERVER",
      "hostRef" : {
        "hostId" : "544af6f5-b3ea-46b6-8174-435ecec6fd98"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "1t2fiw3y3xco2j77f3ofod8u1"
        } ]
      }
    }, {
      "name" : "mgmt-HOSTMONITOR-50ccc2a9d514bbca1e9edd184951bfb9",
      "type" : "HOSTMONITOR",
      "hostRef" : {
        "hostId" : "544af6f5-b3ea-46b6-8174-435ecec6fd98"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "8i4l26skj5spzq1q0q2haog09"
        } ]
      }
    }, {
      "name" : "mgmt-REPORTSMANAGER-50ccc2a9d514bbca1e9edd184951bfb9",
      "type" : "REPORTSMANAGER",
      "hostRef" : {
        "hostId" : "544af6f5-b3ea-46b6-8174-435ecec6fd98"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "dd0ddc5fyui90acjdzciawu0v"
        } ]
      }
    }, {
      "name" : "mgmt-SERVICEMONITOR-50ccc2a9d514bbca1e9edd184951bfb9",
      "type" : "SERVICEMONITOR",
      "hostRef" : {
        "hostId" : "544af6f5-b3ea-46b6-8174-435ecec6fd98"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "19963q9gbwag6ccnumc8nbgo1"
        } ]
      }
    } ],
    "displayName" : "Cloudera Management Service"
  },
  "managerSettings" : {
    "items" : [ {
      "name" : "CLUSTER_STATS_START",
      "value" : "10/22/2012 20:00"
    }, {
      "name" : "PUBLIC_CLOUD_STATUS",
      "value" : "NOT_ON_PUBLIC_CLOUD"
    }, {
      "name" : "REMOTE_PARCEL_REPO_URLS",
      "value" : "https://archive.cloudera.com/cdh5/parcels/{latest_supported}/,https://archive.cloudera.com/cdh4/parcels/latest/,https://archive.cloudera.com/impala/parcels/latest/,https://archive.cloudera.com/search/parcels/latest/,https://archive.cloudera.com/accumulo/parcels/1.4/,https://archive.cloudera.com/accumulo-c5/parcels/latest/,https://archive.cloudera.com/kafka/parcels/latest/,https://archive.cloudera.com/navigator-keytrustee5/parcels/latest/,https://archive.cloudera.com/spark/parcels/latest/,https://archive.cloudera.com/sqoop-connectors/parcels/latest/"
    } ]
  }
}% 
```

####docs and examples
`https://www.cloudera.com/documentation/enterprise/5-4-x/topics/cm_intro_api.html`

#### with port fowarding
`curl -u admin:admin 'http://localhost:7180/api/v1/clusters'`
####without portfowarding
`curl -u admin:admin 'http://52.169.236.34:7180/api/v1/clusters`
####results
```aidl
{
  "items" : [ {
    "name" : "phgolardbd",
    "version" : "CDH5"
  } ]
}%    
```