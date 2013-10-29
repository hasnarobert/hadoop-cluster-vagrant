group { "puppet":
    ensure => "present"
}

exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

package { "openjdk-6-jdk":
    ensure => present,
    require => Exec['apt-update'],
}

package { "vim":
    ensure => present,
    require => Exec['apt-update'],
}

file { "/root/.ssh":
    ensure => "directory",
    owner => root,
    group => root,
    mode => 770
}

file { "/script":
    ensure => "directory",
    owner => root,
    group => root,
    mode => 777
}

file { "/root/.ssh/id_rsa":
    source => "puppet:///modules/hadoop/id_rsa",
    mode => 600,
    owner => root,
    group => root,
    require => File["/root/.ssh"]
}

file { "/root/.ssh/id_rsa.pub":
    source => "puppet:///modules/hadoop/id_rsa.pub",
    mode => 644,
    owner => root,
    group => root,
    require => File["/root/.ssh"]
}

ssh_authorized_key { "ssh_key":
    ensure => "present",
    key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDUISMFhE41dvZUnxoWDiCqHgVRH7wAtA41hCtFNILrPFWPkycXni/5ofLDxlouJiueIyZoSXm41OyjBd6IAEgqZvgutx+q0FH21zOH3cHYOO0/eBrUH0yCRlJgfTgG3GrB15OhWfomEckDmD2lJHNatF3vE4LocuhbfuMmw+AyMFjVT095yolBZGpt0W7V0CgsXp85db7FvRCKQfYgSLHBiUScaiGrzXeL4narTtRkNqKEz7O6a8qFCiiKcWUNrHDzdoZHjocxenRw6bOshA/msQkW4DimUZqlnqJY4pDmyGcpeaovvKkvXOpYzJun+xxaXv6Iyz903P83jWpFYN2f",
    type   => "ssh-rsa",
    user   => "root",
    require => File['/root/.ssh/id_rsa.pub']
}

file { "/etc/hosts":
    source => "puppet:///modules/hadoop/hosts",
    mode => 644,
    owner => root,
    group => root
}

file { "/script/known_hosts.sh":
    source => "puppet:///modules/hadoop/known_hosts.sh",
    mode => 777,
    owner => root,
    group => root
}

include hadoop
