#
# Cookbook Name:: db-mysql-server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set['mysql']['allow_remote_root']      = false
node.set['mysql']['remove_anonymous_users'] = false
node.set['mysql']['remove_test_database']   = true

node.set['mysql']['server_debian_password']   = "password"
node.set['mysql']['server_root_password']   = "password"
node.set['mysql']['server_repl_password']   = "password"

include_recipe "yum::remi"

include_recipe "mysql::ruby"
include_recipe "mysql::server"

include_recipe "database"


mysql_connection_info = {
  :host     => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}


mysql_database 'db_name' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'user_name' do
  connection mysql_connection_info
  password 'user_pass'
  database_name 'db_name'
  host '%'
  privileges [:select,:update,:insert]
  action :grant
end
