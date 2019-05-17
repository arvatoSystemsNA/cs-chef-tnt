#
# Cookbook Name:: cs-chef-tnt
# Recipe:: packages
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'powershell::powershell4' if node['tnt']['install_powershell4']

node.normal['seven_zip']['syspath'] = true
include_recipe 'seven_zip' if node['tnt']['install_seven_zip']

include_recipe 'chocolatey'


