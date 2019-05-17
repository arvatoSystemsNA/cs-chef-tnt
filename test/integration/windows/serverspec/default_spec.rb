require 'serverspec'

set :backend, :cmd
set :os, :family => 'windows'


describe 'cs-chef-tnt::default' do

  # describe file('D:/TNT-files') do
  #   it { should be_directory }
  #   it { should be_readable }
  #   it { should_not be_writable.by('Everyone') }
  # end
  #
  # describe file('c:/temp/test.txt') do
  #   it { should be_file }
  #   it { should contain "some text" }
  # end

  # describe package('Adobe AIR') do
  #   it { should be_installed}
  # end
  #
  # describe service('DNS Client') do
  #   it { should be_installed }
  #   it { should be_enabled }
  #   it { should be_running }
  #   it { should have_start_mode("Manual") }
  # end

  describe port(80) do
    it { should be_listening }
  end

  describe user('Administrator') do
    it { should exist }
    it { should belong_to_group('Administrators')}
  end

  describe group('Guests') do
    it { should exist }
  end


end
