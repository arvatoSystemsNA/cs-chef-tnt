# Cookbook Name:: cs-chef-tnt
# Recipe:: apache24
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chocolatey'

chocolatey 'apache-httpd' do
  options ({ 'params' => '"/unzipLocation:C: /serviceName:Apache2.4 /installLocation:'+node['apache']['windows']['install_dir']+'"' })
  action :install
  version node['apache']['apache-httpd-version']
end

%w{ ABOUT_APACHE.txt  CHANGES.txt  INSTALL.txt  LICENSE.txt
  NOTICE.txt  OPENSSL-NEWS.txt  OPENSSL-README.txt  README.txt }.each do |dfile|
    file "#{node['apache']['windows']['dir']}/" + dfile do
      action :delete
    end
end

file node['apache']['windows']['conf'].to_str + '/openssl.cnf' do
  action :delete
end



template node['apache']['windows']['docroot_dir'].to_str + '/index.html' do
  source 'apache24/index.html.erb'
  action :create
  notifies :restart,  "service[Apache2.4]", :delayed
end

directory node['apache']['windows']['extra']['vhosts']['dir'].to_str do
  action :create
end

template node['apache']['windows']['extra']['vhosts']['dir'].to_str + "/tnt-host.conf" do
  source 'apache24/tnt-host.conf.erb'
  action :create
end

template node['apache']['windows']['conf'].to_str do
  source 'apache24/httpd.conf.erb'
  action :create
  backup false
end

# Start apache service
service 'Apache2.4' do
  action [:enable, :start]
end
