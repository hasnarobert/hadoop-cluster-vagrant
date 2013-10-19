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

include hadoop
