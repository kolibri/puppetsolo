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

    exec { 'update_puppet_repo_submodules' :
        cwd => $path,
        command => "${git::params::bin} submodule update --recursive",
        require => Git::Repo['puppet'],
    }    
}
