#
# Cookbook:: jq
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
install_dir = node["jq"]['install_dir']
version =  node["jq"]['version']

directory install_dir do
  owner 'root'
  group 'root'
  mode '0775'
end

remote_file "#{node["jq"]['install_dir']}/#{node["jq"]['name']}" do
  source URI.escape("http://#{node[:mirror][:host]}#{node[:mirror][:path]}/jq/jq-1.5/jq-linux64")
  mode '0775'
end