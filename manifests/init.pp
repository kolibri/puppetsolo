class puppetsolo (
    $user = root,
    $manifest = '/var/puppet/manifests/site.pp',
    $modulepath = '/etc/puppet/modules/',
    $logfile = '/var/logs/puppet_run.log',
)
{
    file { '/var/crons':
        ensure => directory,
    }

    file { '/var/crons/puppet.sh':
        ensure => present,
        content => template("puppetsolo/puppet.sh.erb"),
        mode => '744',
        owner => $user,
    }

    cron { puppetrun:
        command => '/var/crons/puppet.sh',
        user    => $user,
        minute  => '*/30',
        require => File['/var/crons/puppet.sh'],
    }
}
