#
# Cookbook Name:: cs-chef-tnt
# attributes:: tnt-scripts
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#

# used for test and in the unlikely case the SQL Server needs to be installed on the same instance as tnt
default['sql_server']['version'] = '2016'
default['sql_server']['accept_eula'] = true


default['sql_server']['sqlcmd_path'] = 'C:\Program Files\Microsoft SQL Server\110\Tools\Binn\sqlcmd.exe'
