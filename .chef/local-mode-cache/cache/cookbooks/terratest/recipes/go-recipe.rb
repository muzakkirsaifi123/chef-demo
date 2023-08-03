#
# Cookbook:: terratest
# Recipe:: go-recipe
#
# Copyright:: 2023, The Authors, All Rights Reserved.
# Install Go from URL
remote_file '/tmp/go.tar.gz' do
  source 'https://go.dev/dl/go1.20.7.linux-amd64.tar.gz'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'extract_go' do
  command 'tar -C /usr/local -xzf /tmp/go.tar.gz'
  not_if { ::File.exist?('/usr/local/go/bin/go') }
end

file '/etc/profile.d/go.sh' do
  content 'export PATH=$PATH:/usr/local/go/bin'
  mode '0755'
  owner 'root'
  group 'root'
  action :create
end
