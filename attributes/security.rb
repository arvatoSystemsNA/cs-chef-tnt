
# id of the deep security policy to set by default. The policy needs to exist or the run will fail.
# The assigned policy can later on be modified in the Deep Security UI without being overidden since
# the agnet is installed only once
default['deep_security']['policy_id']= 'windows'
default['deep_security']['skip']=false

# When the Deep security firewall module is not used this should be kept to false to prevent issues when using docker
# see https://help.deepsecurity.trendmicro.com/using-deep-security-agent-iptables-windows-firewall.html
default['deep_security']['disable_ip_table']=false
