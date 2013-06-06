class puppetsolo::repository (
    $path = '/var/puppet',
    $source = false,
    $branch = 'master'
){
    git::repo{ 'puppet':
        path   => $path,
        source => $source,
        update   => true,
        branch => $branch,
    }

    exec { 'init_puppet_repo_submodules' :
        cwd => $path,
        command => "${git::params::bin} submodule init",
        require => Git::Repo['puppet'],
    }    

    exec { 'update_puppet_repo_submodules' :
        cwd => $path,
        command => "${git::params::bin} submodule update",
        require => Exec['init_puppet_repo_submodules']
    }    

    exec { 'pull_puppet_repo_submodules' :
        cwd => $path,
        command => "${git::params::bin} submodule foreach git pull origin master",
        require => Exec['update_puppet_repo_submodules']
    }    
}
