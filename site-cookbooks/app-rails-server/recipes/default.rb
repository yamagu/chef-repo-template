#
# Cookbook Name:: app-rails-server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "linux-server"

node.set["rbenv"]["root_path"] = "/usr/local/rbenv"

node.set['rbenv']['rubies']    = ['1.9.3-p448']
node.set['rbenv']['gems'] = {
  '1.9.3-p448' => [
    {'name'  => 'bundler'},
    {'name'  => 'mysql'},
    {'name'  => 'rbenv-rehash'}
  ]
}

include_recipe "ruby_build"
include_recipe "rbenv::system"

rbenv_global "1.9.3-p448"

