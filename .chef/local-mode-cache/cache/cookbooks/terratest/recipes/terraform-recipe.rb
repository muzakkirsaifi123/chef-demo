#
# Cookbook:: terratest
# Recipe:: terratest-recipe
#
# Copyright:: 2023, The Authors, All Rights Reserved.
# Update the package
# Install Terraform
remote_file '/tmp/terraform.zip' do
  source 'https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'unzip_terraform' do
  command 'unzip /tmp/terraform.zip -d /usr/local/bin'
  not_if { ::File.exist?('/usr/local/bin/terraform') }
end
