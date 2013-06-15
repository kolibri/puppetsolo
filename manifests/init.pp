class puppetsolo (
  $user = root,
  $manifest      = '/var/puppet/manifests/site.pp',
  $modulepath    = '/etc/puppet/modules/',
  $logfile       = '/var/log/puppet/puppetsolo_run.log',
  $update_script = '/home/ultima/puppet/git_submodule_update.sh'
){
  file { '/var/crons':
    ensure  => directory,
  }

  file { '/var/crons/puppet.sh':
    ensure  => present,
    content => template('puppetsolo/puppet.sh.erb'),
    mode    => '0744',
    owner   => $user,
  }

  cron { 'puppetrun':
    command => '/var/crons/puppet.sh',
    user    => $user,
    minute  => '*/30',
    require => File['/var/crons/puppet.sh'],
  }
}
