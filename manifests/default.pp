exec { "apt-update":
    command => "/usr/bin/apt-get update"
}
Exec["apt-update"] -> Package <| |>

include profile::jenkins_and_plugins

class{'profile::gitlab_ce':
	swap_file => true, # Gitlab recomends a swap file if another big service runs in the same machine (example jenkins)
	unicorn_port => '8180' #Unicorn and Jenkins use port 8080
}