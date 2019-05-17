
default['apache']['apache-httpd-version'] = '2.4.20.20160427'
default['cs']['app']['tnt']['client'] = 'base'
default['apache']['windows']['dir']             = "c:\\Apache24"
default['apache']['windows']['install_dir']             = "c:"
default['apache']['windows']['conf']            = "#{node['apache']['windows']['dir']}\\conf\\httpd.conf"
default['apache']['windows']['ssl']             = "#{node['apache']['windows']['dir']}\\conf\\ssl"
default['apache']['windows']['docroot_dir']     = "#{node['apache']['windows']['dir']}\\htdocs"
default['apache']['windows']['extra']['vhosts']['dir'] = "#{node['apache']['windows']['dir']}\\conf\\vhost"
default['apache']['windows']['log_level']     = 'info'
# FIXME: Add env support
default['apache']['windows']['application_url'] = 'test.base-tnt.com'

default['cs']['app']['tnt']['bucket_path_certificate'] = "ssl-certificate.crt"
default['cs']['app']['tnt']['bucket_path_chain'] = "ssl-chain.crt"
default['cs']['app']['tnt']['bucket_path_key'] = "ssl-key.key"

default['cs']['app']['tnt']['email'] = "tnt-dev@arvatosystems.io"

default['cs']['app']['tnt']['aws']['access_key'] = nil
default['cs']['app']['tnt']['aws']['secret_access_key'] = nil

