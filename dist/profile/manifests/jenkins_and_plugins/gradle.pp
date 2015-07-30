class profile::jenkins_and_plugins::gradle{

	package { 'unzip':
	  ensure => installed
	}

	$gradle_version="2.5"
	archive { "gradle-${gradle_version}":
	  ensure 		=> present,
	  url    		=> "https://downloads.gradle.org/distributions/gradle-${gradle_version}-bin.zip",
	  extension  	=> "zip",
	  target 	 	=> "/opt",
	  checksum 		=> false,
	  timeout 		=> 1200,
	  require 		=> Package['unzip']
	}

	$gradle_plugin_version='1.24'
	jenkins::plugin {'gradle':
		version=>$gradle_plugin_version
	}

	$gradle_home="/opt/gradle-${gradle_version}"
	file { '/var/lib/jenkins/hudson.plugins.gradle.Gradle.xml':
	    ensure  => file,
	    mode    => '0644',
		content => template("profile/gradle_jenkins_conf.erb"),
		notify	=> Service["jenkins"]
	}
}