#
# Cookbook Name:: cs-chef-tnt
# Recipe:: tnt-scripts
# All rights reserved - Do Not Redistribute
#

directory node['cs']['app']['tnt']['files'] do
  action :create
end

remote_directory node['cs']['app']['tnt']['files'] + "/sql" do
  source "apache24/sqlv2"
  recursive true
end

aws_ssm_parameter_store 'get db master pwd' do
  name '/parameterStore/TNTDBPassword'
  return_key 'decrypted_master_pwd'
  with_decryption true
  action :get
end

aws_ssm_parameter_store 'get tnt user pwd' do
  name '/parameterStore/TNTPassword'
  return_key 'decrypted_tnt_pwd'
  with_decryption true
  action :get
end

aws_ssm_parameter_store 'get epcat user pwd' do
  name '/parameterStore/EpcatPassword'
  return_key 'decrypted_epcat_pwd'
  with_decryption true
  action :get
end

aws_ssm_parameter_store 'get sa user pwd' do
  name '/parameterStore/TNTSaPassword'
  return_key 'decrypted_sa_pwd'
  with_decryption true
  action :get
end


template node['cs']['app']['tnt']['files'] + "/sql/V1_logins-create.sql" do
  source 'apache24/sqlv2/V1_logins-create.sql.erb'
  sensitive true
  variables lazy {
    {
        decrypted_master_pwd: node.run_state['decrypted_master_pwd'],
        decrypted_tnt_pwd: node.run_state['decrypted_tnt_pwd'],
        decrypted_epcat_pwd: node.run_state['decrypted_epcat_pwd'],
        decrypted_sa_pwd: node.run_state['decrypted_sa_pwd'],
    }
  }
end

template node['cs']['app']['tnt']['files'] + "/sql/V2_database-tnt.sql" do
  source 'apache24/sqlv2/database.sql.erb'
  sensitive true
  variables(
      data_file_size: node['tnt']['tnt_db_data_file_size'],
      data_max_file_size: node['tnt']['tnt_db_data_max_file_size'],
      data_file_growth: node['tnt']['tnt_db_data_file_growth'],
      log_file_size: node['tnt']['tnt_db_log_file_size'],
      log_max_file_size: node['tnt']['tnt_db_log_max_file_size'],
      log_file_growth: node['tnt']['tnt_db_log_file_growth'],
      db_name: 'tnt',
      db_username: 'tnt'
  )

end

template node['cs']['app']['tnt']['files'] + "/sql/V3_database-epcat.sql" do
  source 'apache24/sqlv2/database.sql.erb'
  sensitive true
  variables(
      data_file_size: node['tnt']['epcat_db_data_file_size'],
      data_max_file_size: node['tnt']['epcat_db_data_max_file_size'],
      data_file_growth: node['tnt']['epcat_db_data_file_growth'],
      log_file_size: node['tnt']['epcat_db_log_file_size'],
      log_max_file_size: node['tnt']['epcat_db_log_max_file_size'],
      log_file_growth: node['tnt']['epcat_db_log_file_growth'],
      db_name: 'epcat',
      db_username: 'epcat'
  )

end

template node['cs']['app']['tnt']['files'] + "/sql/V5_database-tempdb.sql" do
  source 'apache24/sqlv2/V5_database-tempdb.sql.erb'
  sensitive true
end


execute 'Execute SQL scripts' do
  filePath = node['cs']['app']['tnt']['files']
  extractPath = node['cs']['app']['tnt']['sql']['extract-path']
  user =  node['cs']['app']['tnt']['sql_account']
  if (node['cs']['app']['tnt']['database_endpoint'])
    instance = node['cs']['app']['tnt']['database_endpoint']
  else
    # for BW compatibility
    instance = node['sql_server']['instance_name']
  end

  sqlcmdPath = node['sql_server']['sqlcmd_path']

  sensitive true
  environment lazy {
    {
        SQLCMDPASSWORD: node.run_state['decrypted_master_pwd']
    }
  }

  command "#{filePath}/sql/run-sql-script.bat \"#{user}\" \"#{instance}\" #{extractPath} \"#{sqlcmdPath}\""
  not_if "\"#{sqlcmdPath}\" -b -V1 -U #{user} -S #{instance} -Q \"IF (SELECT COUNT(name) FROM sys.databases WHERE name IN ('tnt', 'epcat', 'tempdb')) != 3 RAISERROR('Databases do not exist', 1, 1)\""
end
