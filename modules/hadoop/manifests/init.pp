class hadoop {
    $hadoop_home = "/opt/hadoop"

    exec { "download_hadoop":
        command => "wget -O /tmp/hadoop.tar.gz http://mirrors.hostingromania.ro/apache.org/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz",
        path => $path,
        unless => "ls /opt | grep hadoop-1.2.1",
        require => Package["openjdk-6-jdk"]
    }

    exec { "unpack_hadoop" :
        command => "tar -zxf /tmp/hadoop.tar.gz -C /opt",
        path => $path,
        creates => "${hadoop_home}-1.2.1",
        require => Exec["download_hadoop"]
    }
}
