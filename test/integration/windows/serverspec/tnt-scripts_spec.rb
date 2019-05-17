require 'serverspec'

describe 'cs-chef-tnt::tnt-scripts' do
  user = 'sa'
  password = 'Password123'
  instance = '.\SQLEXPRESS'

  # describe command("sqlcmd -b -V1 -U #{user} -P #{password} -S #{instance} -Q \"IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'tnt') RAISERROR('tnt database does not exist', 1, 1)\"") do
  #   its(:exit_status) { should eq 0 }
  # end
  #
  # describe command("sqlcmd -b -V1 -U #{user} -P #{password} -S #{instance} -Q \"IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'tnt_activiti') RAISERROR('tnt_activiti database does not exist', 1, 1)\"") do
  #   its(:exit_status) { should eq 0 }
  # end
  #
  # describe command("sqlcmd -b -V1 -U #{user} -P #{password} -S #{instance} -Q \"IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'tempdb') RAISERROR('tempdb database does not exist', 1, 1)\"") do
  #   its(:exit_status) { should eq 0 }
  # end
  #
  # describe command("sqlcmd -b -V1 -U #{user} -P #{password} -S #{instance} -Q \"IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'templog') RAISERROR('templog database does not exist', 1, 1)\"") do
  #   its(:exit_status) { should eq 0 }
  # end

end
