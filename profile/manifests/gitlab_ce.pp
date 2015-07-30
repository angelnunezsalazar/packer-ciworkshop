class profile::gitlab_ce(
	$swap_file= false,
	$unicorn_port = '8080'
){

	if($swap_file){
		swap_file::files { 'default':
		  ensure   		=> present,
		  swapfilesize 	=> "512 MB",
		  before		=> Class['gitlab']
		}
	}

	# Setting the root password
	# https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md
	Exec {
	  environment => ["GITLAB_ROOT_PASSWORD=password"],
	}

	# Gitlab requiriements
	include redis
	include nginx
	include mysql::server
	include git
	include logrotate

	mysql::db {'gitlab': user => 'user', password => 'password' }

	class {'gitlab':
		git_email                => 'gitlab@kleer.la',
		git_comment              => 'GitLab',
		gitlab_domain            => 'gitlab.kleer.la',
		gitlab_http_timeout      => '300',
		gitlab_dbtype            => 'mysql',
		gitlab_dbname            => 'gitlab',
		gitlab_dbuser            => 'user',
		gitlab_dbpwd             => 'password',
		gitlab_unicorn_port		 => $unicorn_port
	}
}