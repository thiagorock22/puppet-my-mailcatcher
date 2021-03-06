class mailcatcher {

    Package['libsqlite3-dev']
        -> Package['ruby1.9.1-dev']
        -> Package['build-essential']
        -> Exec['install-mailcatcher']
        -> File['/etc/init/mailcatcher.conf']

    package { 'libsqlite3-dev':
        ensure => present,
    }

    package { 'ruby1.9.1-dev':
        ensure => present,
    }

    package { 'build-essential':
        ensure => present,
    }

    exec { 'install-mailcatcher':
        path => '/usr/bin',
        command => 'sudo gem install mailcatcher',
        timeout => 300
    }

    file { '/etc/init/mailcatcher.conf' :
        path => '/etc/init/mailcatcher.conf',
        source  => 'puppet:///modules/mailcatcher/service.conf',
        ensure => file
    }
}
