source "https://supermarket.chef.io"
solver :ruby, :preferred

metadata

cookbook "windows-hardening", "~> 0.9.0"
cookbook "windows", ">=1.38.0"
cookbook "chocolatey", "~> 1.2.0"
cookbook "datadog", ">= 2.1.0"
cookbook "powershell", "~> 5.1.0"
cookbook 'seven_zip', '~> 2.0.2'
cookbook 'aws', '~> 7.5.0'
cookbook 'sql_server', '~> 5.5.0'

cookbook 'cs-chef-base-wrapper', '>= 0.4.12', path: '../.chef/cookbooks/cs-chef-base-wrapper'
# Below are non supermarket dependencies needed for the base wrapper
cookbook 'cs-chef-datadog-wrapper', '~> 1.1.0', path: "../.chef/cookbooks/cs-chef-datadog-wrapper"
cookbook 'cs-chef-users', "~> 2.1.1", path: "../.chef/cookbooks/cs-chef-users"
cookbook 'cs-chef-ohai-plugin', '~> 0.2.0', path: "../.chef/cookbooks/cs-chef-ohai-plugin"
cookbook 'cs-chef-cloudwatch', '~> 0.1.7', path: "../.chef/cookbooks/cs-chef-cloudwatch"
cookbook 'ohai-plugins', '~> 1.0.1', path: "../.chef/cookbooks/ohai-plugins"
cookbook 'deep-security-agent', "~> 0.1.0"
cookbook 'cs-chef-os-hardening', "~> 0.1.0",  path: "../.chef/cookbooks/cs-chef-os-hardening"
cookbook 'cs-chef-cloudaware-nessus-wrapper', "~> 0.1.0",  path: "../.chef/cookbooks/cs-chef-cloudaware-nessus-wrapper"
cookbook 'nessus-agent', "~> 1.0.3",  path: "../.chef/cookbooks/nessus-agent"
cookbook 'cs-chef-sensu-wrapper', "~> 0.1.0", path: "../.chef/cookbooks/cs-chef-sensu-wrapper"
cookbook 'cs-chef-logstash-forwarder', "~> 0.1.0", path: "../.chef/cookbooks/cs-chef-logstash-forwarder"
cookbook 'monitor', git: 'https://github.com/arvatoaws/chef-monitor.git'
cookbook 'dpkg_autostart', '=0.4.0'



