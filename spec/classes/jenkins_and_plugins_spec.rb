require 'spec_helper'

describe 'profile::jenkins_and_plugins' do
	let(:facts) { 
		{
			:path =>  '/' #the module 'archive' needs and exec path previously define in the manifest
		} 
	}

    context 'The catalog should at the very least compile' do
	    it { should compile }
	end

  	context 'The following subclass should be in the catalog' do
	    it { should contain_class('jenkins')}
  	end

  	context 'Jenkins should contains the following plugins' do
	    it { should contain_jenkins__plugin('git')}
	    it { should contain_jenkins__plugin('gradle')}
	    it { should contain_jenkins__plugin('jacoco')}
  	end
end