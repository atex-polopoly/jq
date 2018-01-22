#
# Cookbook:: jq
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
install_dir = node["jq"]['install_dir']

directory install_dir do
  owner 'root'
  group 'root'
  mode '0775'
end

remote_file "#{node["jq"]['install_dir']}/#{node["jq"]['name']}" do
  source 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64'
  mode '0775'
end

execute 'make jq executable' do
  command "chmod +x #{node["jq"]['install_dir']}/#{node["jq"]['name']}"
  not_if { File.file?("#{node["jq"]['install_dir']}/#{node["jq"]['name']}") }
end