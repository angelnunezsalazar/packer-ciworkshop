require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.default_facts = {
    :operatingsystem => 'Ubuntu', 
	:osfamily => 'Debian', 
	:lsbdistcodename => 'trusty',
	:lsbdistid => 'ubuntu'
  }
end