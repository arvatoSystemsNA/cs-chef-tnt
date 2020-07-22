#
# Cookbook Name:: cs-chef-tnt
# attributes:: windows
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#
default['tnt']['install_packages'] = true

default['tnt']['install_application'] = false
default['tnt']['create_databases']= false
default['tnt']['install_apache'] = true
default['tnt']['install_monitoring'] = true
default['tnt']['install_security-packages'] = true
default['tnt']['install_sqlutils'] = true
