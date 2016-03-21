#
# Cookbook Name:: node_meta
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("ip => #{ node.normal.deployment_job.host_id}")

template '/etc/nodeMeta.info' do
  source 'nodeMeta.erb'
  variables(
    uuid:  node.normal.deployment_job.host_id,
    type: 'bare-metal',
    ip: node['ipaddress'],
    comment: node['fqdn']
  )
end

meta_file = '/etc/nodeMeta.info'

file meta_file do
  owner "root"
  group "root"
  mode "644"
end
