#
# Cookbook Name:: gutsec_web
# Recipe:: user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
group node['gutsec_web']['group']

user node['gutsec_web']['user'] do
	group node['gutsec_web']['group']
	system true
	shell '/bin/bash'
end
