#
# Cookbook Name:: cs-chef-tnt
# attributes:: application
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#
default['cs']['app']['tnt']['client'] = 'base'
default['cs']['app']['tnt']['env'] = 'dev'
default['cs']['app']['tnt']['files'] = 'D:\TNT-files'
default['cs']['app']['tnt']['installer'] = node['cs']['app']['tnt']['files'] + '\arvato-systems-tnt-appl-installer-1.0.21-tnt-1.01.000.exe'
default['cs']['app']['tnt']['cm_installer'] = node['cs']['app']['tnt']['files'] + '\arvato-systems-tnt-cm-installer-1.0.6-cm-1.01.000.exe'
default['cs']['app']['tnt']['epcat_zip'] = node['cs']['app']['tnt']['files'] + '\EPCAT 1.2.47.zip'
default['cs']['app']['tnt']['bucket'] = "#{node['cs']['app']['tnt']['client']}-tnt-#{node['cs']['app']['tnt']['client']}-#{node['cs']['app']['tnt']['env']}-chef-s3"
default['cs']['app']['tnt']['tnt_bucket_path'] = 'arvato-systems-tnt-appl-installer-1.0.21-tnt-1.01.000.exe'
default['cs']['app']['tnt']['cm_bucket_path'] = 'arvato-systems-tnt-cm-installer-1.0.6-cm-1.01.000.exe'
default['cs']['app']['tnt']['epcat_bucket_path'] = 'EPCAT 1.2.47.zip'
default['cs']['app']['tnt']['extract_with_overwrite'] = false
default['cs']['app']['tnt']['sql']['extract-path'] = node['cs']['app']['tnt']['files'] + '\sql'
default['cs']['app']['tnt']['aws']['access_key'] = nil
default['cs']['app']['tnt']['aws']['secret_access_key'] = nil

default['cs']['app']['java']['install_java'] = true
default['cs']['app']['java']['files'] = 'D:\TNT-files'
default['cs']['app']['java']['installer'] = node['cs']['app']['java']['files'] + '\amazon-corretto-8.212.04.2-windows-x64-jdk.zip'
default['cs']['app']['java']['bucket'] = "#{node['cs']['app']['tnt']['client']}-tnt-#{node['cs']['app']['tnt']['client']}-#{node['cs']['app']['tnt']['env']}-chef-s3"
default['cs']['app']['java']['java_bucket_path'] = 'amazon-corretto-8.212.04.2-windows-x64-jdk.zip'
default['cs']['app']['java']['aws']['access_key'] = nil
default['cs']['app']['java']['aws']['secret_access_key'] = nil

default['cs']['app']['java']['directory']='C:\Java'
default['cs']['app']['java']['archive']='D:\TNT-files\amazon-corretto-8.212.04.2-windows-x64-jdk.zip'
default['cs']['app']['java']['extract_with_overwrite']=false
default['cs']['app']['java']['extracted_directory']='C:\Java\jdk1.8.0_212'

default['cs']['app']['tnt']['log_folder'] = "D:\\TNT-CORE\\log"
## CloudWatch log configuration
#

default['cloudwatchlog']['windows']['streams']['tnt_gui']={
    :id => 'CloudWatchLogs-Logs-TntGui',
    :region=> 'us-east-1',
    :suffix => "tntgui"
}
default['cloudwatchlog']['windows']['streams']['tnt_core']={
    :id => 'CloudWatchLogs-Logs-TntCore',
    :region=> 'us-east-1',
    :suffix => "tntcore"
}

default['cloudwatchlog']['windows']['logs']['tnt_gui_info']={
    :Id => 'TntGuiInfo',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss,fff',
        :Encoding => 'UTF-8',
        :Filter => 'tnt_gui_info_*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_core-stderr']={
    :Id => 'TntCoreStderr',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss',
        :Encoding => 'UTF-8',
        :Filter => 'tnt_core-stderr*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_core']={
    :Id => 'TntCore',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['log_folder'],
        :TimestampFormat => 'ddd MMM dd HH:mm:ss "UTC" yyyy',
        :Encoding => 'UTF-8',
        :Filter => 'tnt_core_*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['streamflows']['tnt_core'] = {
    :logs => ['TntCore', 'TntCoreStderr'],
    :streams => ['CloudWatchLogs-Logs-TntCore']}
default['cloudwatchlog']['windows']['streamflows']['tnt_gui'] = {
    :logs => ['TntGuiInfo'],
    :streams => ['CloudWatchLogs-Logs-TntGui']}


