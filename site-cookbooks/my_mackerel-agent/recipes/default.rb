#
# Cookbook Name:: my_mackerel-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node.default['mackerel-agent']['conf']['apikey'] = 'Your API KEY' # required
node.default['mackerel-agent']['conf']['roles'] = ["My-Service:app"] # optional

include_recipe "mackerel-agent"
