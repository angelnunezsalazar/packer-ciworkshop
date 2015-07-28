class ciworkshop::jenkins_and_plugins{

	contain jenkins
	
	contain ciworkshop::jenkins_and_plugins::git
	contain ciworkshop::jenkins_and_plugins::gradle

	$other_plugins = {
	  'greenballs' 		=> { version    => '1.14'},
	  'htmlpublisher' 	=> { version    => '1.4'},
	  'jacoco' 			=> { version    => '1.0.19'},
	  'violations' 		=> { version    => '0.7.11'}
	}
	create_resources(jenkins::plugin,$other_plugins)
}