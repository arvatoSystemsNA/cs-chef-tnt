#
# Cookbook Name:: cs-chef-tnt
# Recipe:: default
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#


unless node['platform_family'] == 'windows'
  raise Chef::Exceptions::Application, 'This cookbook only works on Microsoft Windows.'
end

include_recipe 'cs-chef-tnt::packages' if node['tnt']['install_packages']

include_recipe 'cs-chef-tnt::sql-server' if node['tnt']['install_sqlutils']

include_recipe 'cs-chef-tnt::application' if node['tnt']['install_application'] || node['cs']['app']['java']['install_java'] || node['tnt']['create_databases']

include_recipe 'cs-chef-tnt::apache24' if node['tnt']['install_apache']

include_recipe 'cs-chef-tnt::monitoring' if node['tnt']['install_monitoring'] && node['sensu']['enable']

