#
# Cookbook Name:: my_fluentd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#include_recipe "td-agent"

group 'td-agent' do
  group_name 'td-agent'
  gid 501
  system true
  action [:create]
end

user 'td-agent' do
  comment 'td-agent'
  uid 502
  system true
  group 'td-agent'
  home '/var/run/td-agent'
  shell '/bin/false'
  password nil
  supports :manage_home => true
  action [:create, :manage]
end

directory '/var/run_td-agent/' do
  owner 'td-agent'
  group 'td-agent'
  mode '0755'
  action :create
end

directory '/etc/td-agent/' do
  owner 'td-agent'
  group 'td-agent'
  mode '0755'
  action :create
end
directory '/etc/td-agent/conf.d/' do
  owner 'td-agent'
  group 'td-agent'
  mode '0755'
  action :create
end

execute "install fluentd" do
  command "wget http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh install-ubuntu-trusty-td-agent2.sh"
end

execute "plugin install" do
  command "/usr/sbin/td-agent-gem install fluent-plugin-datacounter fluent-plugin-mackerel"
end

template "/etc/td-agent/td-agent.conf" do
   mode "0644"
   source "td-agent.conf.erb"
   notifies :restart, 'service[td-agent]'
end

service "td-agent" do
  action [ :enable, :start ]
end
