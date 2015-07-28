# Estas dependencias del plugin de git ya se encuentran de caja en Jenkins
# y no se necesitan instalar
	  #'credentials' 	=> { version    => '1.22'},	  
	  #'mailer' 			=> { version    => '1.15'},
	  #'matrix-project' 	=> { version    => '1.4'},
	  #'ssh-credentials' => { version    => '1.11'}

class ciworkshop::jenkins_and_plugins::git{

	$git_plugin = {
	  'git' 			=> { version    => '2.4.0'},
	  'git-client' 		=> { version    => '1.18.0'},
	  'scm-api' 		=> { version    => '0.2'},

	}

	create_resources(jenkins::plugin,$git_plugin)

	include git
}