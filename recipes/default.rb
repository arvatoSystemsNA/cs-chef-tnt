#
# Cookbook Name:: cs-chef-tnt
# Recipe:: default
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#

# remote_file "#{Chef::Config[:file_cache_path]}/cloudcli.msi" do
#   source node['awscli']['windows_url']
#   action :nothing
# end.run_action(:create)
#
# windows_package 'aws_cli_installation' do
#   source "#{Chef::Config[:file_cache_path]}/cloudcli.msi"
#   action :nothing
# end.run_action(:install)
include_recipe 'cs-chef-tnt::windows'
