#
# Cookbook Name:: cs-chef-tnt
# Recipe:: monitoring
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#



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

sensu_check 'TNT_CM' do
  command 'check-windows-service.rb.bat -s TNT_CM'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  additional(
      occurrences: node['monitor']['default_occurrences'],
      refresh: node['monitor']['default_refresh']
  )
end

sensu_check 'TNT_EPCAT' do
  command 'check-windows-service.rb.bat -s TNT_EPCAT'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  additional(
      occurrences: node['monitor']['default_occurrences'],
      refresh: node['monitor']['default_refresh']
  )
end

sensu_check 'TNT_INFO' do
  command 'check-windows-service.rb.bat -s TNT_INFO'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  additional(
      occurrences: node['monitor']['default_occurrences'],
      refresh: node['monitor']['default_refresh']
  )
end

sensu_check 'TNT_CORE' do
  command 'check-windows-service.rb.bat -s TNT_CORE'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  additional(
      occurrences: node['monitor']['default_occurrences'],
      refresh: node['monitor']['default_refresh']
  )
end

sensu_check 'TNT_GUI' do
  command 'check-windows-service.rb.bat -s TNT_GUI'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  additional(
      occurrences: node['monitor']['default_occurrences'],
      refresh: node['monitor']['default_refresh']
  )
end

sensu_check 'TNT_API' do
  command 'check-windows-service.rb.bat -s TNT_API'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  additional(
      occurrences: node['monitor']['default_occurrences'],
      refresh: node['monitor']['default_refresh']
  )
end


sensu_check 'tnt_url' do
  command "check-http.rb.bat -u http://localhost/tnt --response-code 302 -r"
  handlers ['default']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  interval node['monitor']['default_interval']
  additional(
      occurrences: node['monitor']['default_occurrences']
  )
end

sensu_check 'tnt_cm_url' do
  command "check-http.rb.bat -u http://localhost/auth"
  handlers ['default']
  subscribers ['os:windows'] unless node['monitor']['standalone_mode']
  standalone true if node['monitor']['standalone_mode']
  interval node['monitor']['default_interval']
  additional(
      occurrences: node['monitor']['default_occurrences']
  )
end


