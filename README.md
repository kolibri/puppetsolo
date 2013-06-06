puppet-solo
===========

tiny puppet module, that helps to manage puppet on a singel machine without puppet master


How to use
----------

Simply add 
```puppet
class { 'puppetsolo': }
```
to your manifest.

You can set following parameters (defaults are in the example)
```puppet
class { 'puppetsolo':
    $user => root,
    $manifest => '/var/puppet/manifests/site.pp',
    $modulepath => '/etc/puppet/modules/',
    $logfile => '/var/logs/puppet_run.log',
}
```

Hint: You can add more than one modulepath:
```puppet
class { 'puppetsolo':
    $modulepath => '/etc/puppet/modules/:/var/puppet/mymodules:/and/one/more/modulepath'
}
```


