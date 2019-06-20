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

default['cs']['app']['tnt']['tnt_log_folder'] = "D:\\TNT_APP\\logs"
default['cs']['app']['tnt']['cm_log_folder'] = "D:\\TNT_CM\\logs"
## CloudWatch log configuration
#

default['cloudwatchlog']['windows']['streams']['tnt_api']={
    :id => 'CloudWatchLogs-Logs-TntApi',
    :region=> 'us-east-1',
    :suffix => "tntapi"
}

default['cloudwatchlog']['windows']['streams']['tnt_core']={
    :id => 'CloudWatchLogs-Logs-TntCore',
    :region=> 'us-east-1',
    :suffix => "tntcore"
}

default['cloudwatchlog']['windows']['streams']['tnt_infosystem']={
    :id => 'CloudWatchLogs-Logs-TntInfoSys',
    :region=> 'us-east-1',
    :suffix => "tntinfo"
}

default['cloudwatchlog']['windows']['streams']['tnt_epcat']={
    :id => 'CloudWatchLogs-Logs-TntEpcat',
    :region=> 'us-east-1',
    :suffix => "tntepcat"
}

default['cloudwatchlog']['windows']['streams']['tnt_gui']={
    :id => 'CloudWatchLogs-Logs-TntGui',
    :region=> 'us-east-1',
    :suffix => "tntgui"
}

default['cloudwatchlog']['windows']['streams']['cm']={
    :id => 'CloudWatchLogs-Logs-CM',
    :region=> 'us-east-1',
    :suffix => "cm"
}


default['cloudwatchlog']['windows']['logs']['tnt_gui']={
    :Id => 'TntGui',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['tnt_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss,fff',
        :Encoding => 'UTF-8',
        :Filter => 'csdb-tnt-webgui.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_core']={
    :Id => 'TntCore',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['tnt_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss,fff',
        :Encoding => 'UTF-8',
        :Filter => 'csdb-tnt-core.log',
        :TimeZoneKind=> 'UTC'
    }
}


default['cloudwatchlog']['windows']['logs']['tnt_api']={
    :Id => 'TntApi',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['tnt_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss,fff',
        :Encoding => 'UTF-8',
        :Filter => 'csdb-tnt-api.log',
        :TimeZoneKind=> 'UTC'
    }
}



default['cloudwatchlog']['windows']['logs']['tnt_infosys_info']={
    :Id => 'TntInfoSys',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['tnt_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss,fff',
        :Encoding => 'UTF-8',
        :Filter => 'csdb-tnt-infosystem-procrun-stdout*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_epcat_info']={
    :Id => 'TntEpcatInfo',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['tnt_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss.fff',
        :Encoding => 'UTF-8',
        :Filter => 'csdb-tnt-epcat-procrun-stdout*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_epcat_error']={
    :Id => 'TntEpcatStderr',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['tnt_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss.fff',
        :Encoding => 'UTF-8',
        :Filter => 'csdb-tnt-epcat-procrun-stderr*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_cm_info']={
    :Id => 'CmStdOut',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['cm_log_folder'],
        :TimestampFormat => 'HH:mm:ss,fff',
        :Encoding => 'UTF-8',
        :Filter => 'tnt-cm-stdout*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_cm_error']={
    :Id => 'CmStderr',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['cm_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss',
        :Encoding => 'UTF-8',
        :Filter => 'tnt-cm-stderr*.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['logs']['tnt_cm_server']={
    :Id => 'CmServer',
    :FullName => 'AWS.EC2.Windows.CloudWatch.CustomLog.CustomLogInputComponent,AWS.EC2.Windows.CloudWatch',
    :Parameters => {
        :LogDirectoryPath => node['cs']['app']['tnt']['cm_log_folder'],
        :TimestampFormat => 'yyyy-MM-dd HH:mm:ss,fff',
        :Encoding => 'UTF-8',
        :Filter => 'server.log',
        :TimeZoneKind=> 'UTC'
    }
}

default['cloudwatchlog']['windows']['streamflows']['tnt_core'] = {
    :logs => %w(TntCore),
    :streams => ['CloudWatchLogs-Logs-TntCore']}

default['cloudwatchlog']['windows']['streamflows']['tnt_gui'] = {
    :logs => %w(TntGui),
    :streams => ['CloudWatchLogs-Logs-TntGui']}

default['cloudwatchlog']['windows']['streamflows']['tnt_api'] = {
    :logs => %w(TntApi),
    :streams => ['CloudWatchLogs-Logs-TntApi']}

default['cloudwatchlog']['windows']['streamflows']['tnt_infosystem'] = {
    :logs => %w(TntInfoSys),
    :streams => ['CloudWatchLogs-Logs-TntInfoSys']}

default['cloudwatchlog']['windows']['streamflows']['tnt_epcat'] = {
    :logs => %w(TntEpcatInfo TntEpcatStderr),
    :streams => ['CloudWatchLogs-Logs-TntEpcat']}

default['cloudwatchlog']['windows']['streamflows']['cm'] = {
    :logs => %w(CmStdOut CmStderr CmServer),
    :streams => ['CloudWatchLogs-Logs-Cm']}
