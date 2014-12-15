#
# Cookbook Name:: my_mackerel-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "mackerel-agent"
include_recipe 'my_mackerel-agent::my_mackerel-agent-plugins'
