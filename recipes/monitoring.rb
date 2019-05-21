#
# Cookbook Name:: cs-chef-tnt
# Recipe:: monitoring
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#


edit_resource!(:sensu_gem , 'ohai') do
  version '14.8.10'
end

sensu_gem 'sensu-plugins-http' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-apache' do
  version '2.0.0'
end

sensu_check 'apache2.4' do
  command 'check-windows-service.rb.bat -s Apache2.4'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  additional(
      occurrences: node['monitor']['default_occurrences'],
      refresh: node['monitor']['default_refresh']
  )
end

# sensu_check 'tnt_core' do
#   command 'check-windows-service.rb.bat -s tnt_core'
#   handlers ['default']
#   interval node['monitor']['default_interval']
#   subscribers ['os:windows'] unless node['monitor']['standalone_mode']
#   standalone true if node['monitor']['standalone_mode']
#   additional(
#       occurrences: node['monitor']['default_occurrences'],
#       refresh: node['monitor']['default_refresh']
#   )
# end
#
#
# sensu_check 'tnt_gui' do
#   command 'check-windows-service.rb.bat -s tnt_gui'
#   handlers ['default']
#   interval node['monitor']['default_interval']
#   subscribers ['os:windows'] unless node['monitor']['standalone_mode']
#   standalone true if node['monitor']['standalone_mode']
#   additional(
#       occurrences: node['monitor']['default_occurrences'],
#       refresh: node['monitor']['default_refresh']
#   )
# end
#
#
# sensu_check 'tnt_url' do
#   command "check-http.rb.bat -u http://127.0.0.1/TNT/Login.xhtml"
#   handlers ['default']
#   subscribers ['os:windows'] unless node['monitor']['standalone_mode']
#   standalone true if node['monitor']['standalone_mode']
#   interval node['monitor']['default_interval']
#   additional(
#       occurrences: node['monitor']['default_occurrences']
#   )
# end
#
# sensu_check 'apache_metrics' do
#   type 'metric'
#   command 'metrics-apache-graphite.rb.bat -h 127.0.0.1 --scheme :::scheme_prefix::::::name:::.apache'
#   handlers ['metrics']
#   subscribers ['os:windows'] unless node['monitor']['standalone_mode']
#   standalone true if node['monitor']['standalone_mode']
#   interval node['monitor']['metric_interval']
#   additional(
#       occurrences: node['monitor']['metric_occurrences']
#   )
# end

