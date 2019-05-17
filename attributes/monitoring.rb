#
# Cookbook Name:: cs-chef-tnt
# attributes:: default
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#

default['sensu']['enable']= true
default['sensu']['instance_id_name_override']= true
override['sensu']['version'] = '1.2.0-1'
override['uchiwa']['version'] = '1.1.3-1'
