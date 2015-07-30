require 'spec_helper'

describe 'profile::gitlab_ce' do
	
	context 'The catalog should at the very least compile' do
	    it { should compile }
	end

  	context 'The following subclass should be in the catalog' do
	    it { should contain_class('gitlab')}
  	end

  	context 'The root password is set by an env variable' do
	    it { should contain_exec('setup gitlab database').with_environment(['GITLAB_ROOT_PASSWORD=password'])}
  	end

	context 'With swap_file => true, should contains a class that handles swap files' do
		let(:params){
			{
				:swap_file    => true
			}
		}

		it { should contain_swap_file__files('default')}
	end
end