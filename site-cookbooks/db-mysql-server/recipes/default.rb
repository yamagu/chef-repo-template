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


node.set['mysql']['server_debian_password'] = "password"
node.set['mysql']['server_root_password']   = "password"
node.set['mysql']['server_repl_password']   = "password"


include_recipe "mysql::ruby"
include_recipe "mysql::server"

include_recipe "database"

mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

#mysql_database_user 'foo_user' do
#  connection mysql_connection_info
#  password 'password'
#  database_name 'foo'
#  host '%'
#  privileges [:select,:update,:insert]
#  action :grant
#end
