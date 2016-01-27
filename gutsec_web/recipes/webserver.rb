#
# Cookbook Name:: gutsec_web
# Recipe:: webserver
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
# Install Apache and start the service.
httpd_service 'resroots' do
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'resroots' do
  instance 'resroots'
  source 'resroots.conf.erb'
  notifies :restart, 'httpd_service[resroots]'
end

# Create the document root directory.
directory node['gutsec_web']['document_root'] do
  recursive true
end

# Write a default home page.
file "#{node['gutsec_web']['document_root']}/index.php" do
  content '<html>This is a placeholder</html>'
  mode '0644'
  owner node['gutsec_web']['user']
  group node['gutsec_web']['group']
end

# Open port 80 to incoming traffic.
firewall_rule 'http' do
  port 80
  protocol :tcp
  action :allow
end

