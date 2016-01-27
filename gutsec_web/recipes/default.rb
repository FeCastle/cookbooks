#
# Cookbook Name:: gutsec_web
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apt::default'
include_recipe 'gutsec_web::user'
include_recipe 'firewall::default'
include_recipe 'gutsec_web::webserver'
