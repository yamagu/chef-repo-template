#
# Cookbook Name:: linux-server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# 日本語環境
file "/etc/sysconfig/i18n" do
  owner "root"
  group "root"
  mode "0644"
  content 'LANG="ja_JP.UTF-8"'
end

# タイムゾーンをTokyoにする
link "/etc/localtime" do
  to "/usr/share/zoneinfo/Asia/Tokyo"
  link_type :symbolic
end

include_recipe "vim::default"
include_recipe "tmux::default"

node.set["ntp"]["servers"] = ["ntp.nict.jp", "ntp.jst.mfeed.ad.jp"]
include_recipe "ntp::default"

include_recipe "selinux::disabled"
