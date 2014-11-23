#
# Cookbook Name:: my_nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nginx::repo'

package "nginx" do
  action :install
end

service "nginx" do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
end
