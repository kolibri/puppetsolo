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
    user => root,
    manifest => '/var/puppet/manifests/site.pp',
    modulepath => '/etc/puppet/modules/',
    logfile => '/var/logs/puppet_run.log',
}
```

*Hint: You can add more than one modulepath:*
```puppet
class { 'puppetsolo':
    $modulepath => '/etc/puppet/modules/:/var/puppet/mymodules:/and/one/more/modulepath'
}
```

How to set a self updating git repository
-----------------------------------------

If you have your puppet manifests and modules in a git repository, and want puppet update them, add a block like folowing (again, defaults are in the example. You cann ommit them, if they fit to you)
```puppet
class { 'puppetsolo::repository':
    path => '/var/puppet', # the target path, where the repository should be placed
    source => false, # this has to be the path to your repository
    branch => 'master' # the branch, you want to use
}

```

Be sure, your manifest and module path fit to the repository.

*Hint: If you made changes to your repository, it wil need at least two puppet runs, to become this changes run by puppet. One, to fetch the changes, and one to operate them.*
