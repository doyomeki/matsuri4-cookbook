#
# Cookbook Name:: my_td-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'td-agent'

template "/etc/td-agent/td-agent.conf" do
  source 'td-agent.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :restart, "service[td-agent]"
end

template "/etc/init.d/td-agent" do
  source 'td-agent.erb'
  owner  'root'
  group  'root'
  mode   '0755'
  notifies :restart, "service[td-agent]", :immediately
end
