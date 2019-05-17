#
# Cookbook Name:: cs-chef-tnt
# Recipe:: application
#
# Copyright (C) 2019 Arvato
#
# All rights reserved - Do Not Redistribute
#

directory node['cs']['app']['tnt']['files'] do
  action :create
end

# Download the Applications remote file
include_recipe 'aws'
aws_s3_file node['cs']['app']['tnt']['installer'] do
  bucket node['cs']['app']['tnt']['bucket']
  remote_path node['cs']['app']['tnt']['tnt_bucket_path']
  aws_access_key_id node['cs']['app']['tnt']['aws']['access_key']
  aws_secret_access_key node['cs']['app']['tnt']['aws']['secret_access_key']
  not_if { ::File.exist?(node['cs']['app']['tnt']['installer']) }
end

aws_s3_file node['cs']['app']['tnt']['cm_installer'] do
  bucket node['cs']['app']['tnt']['bucket']
  remote_path node['cs']['app']['tnt']['cm_bucket_path']
  aws_access_key_id node['cs']['app']['tnt']['aws']['access_key']
  aws_secret_access_key node['cs']['app']['tnt']['aws']['secret_access_key']
  not_if { ::File.exist?(node['cs']['app']['tnt']['cm_installer']) }
end


aws_s3_file node['cs']['app']['tnt']['epcat_zip'] do
  bucket node['cs']['app']['tnt']['bucket']
  remote_path node['cs']['app']['tnt']['epcat_bucket_path']
  aws_access_key_id node['cs']['app']['tnt']['aws']['access_key']
  aws_secret_access_key node['cs']['app']['tnt']['aws']['secret_access_key']
  not_if { ::File.exist?(node['cs']['app']['tnt']['epcat_zip']) }
end


if node['cs']['app']['java']['install_java']

  aws_s3_file node['cs']['app']['java']['installer'] do
    bucket node['cs']['app']['java']['bucket']
    remote_path node['cs']['app']['java']['java_bucket_path']
    aws_access_key_id node['cs']['app']['java']['aws']['access_key']
    aws_secret_access_key node['cs']['app']['java']['aws']['secret_access_key']
    not_if { ::File.exist?(node['cs']['app']['java']['installer']) }
  end

  seven_zip_archive 'java-extract' do
    path      node['cs']['app']['java']['directory']
    source    node['cs']['app']['java']['archive']
    overwrite node['cs']['app']['java']['extract_with_overwrite']
    timeout   60
    not_if { ::File.directory?(node['cs']['app']['java']['extracted_directory']) }
  end

  env 'JAVA_HOME' do
    value node['cs']['app']['java']['extracted_directory']
  end

  windows_path '%JAVA_HOME%\bin' do
    action :add
  end

end
include_recipe 'cs-chef-tnt::tnt-scripts'
