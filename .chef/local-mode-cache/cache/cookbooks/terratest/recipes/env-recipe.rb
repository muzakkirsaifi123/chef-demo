#
# Cookbook:: terratest
# Recipe:: env-recipe
#
# Copyright:: 2023, The Authors, All Rights Reserved.
# Replace the value below with your ACR p
acr_password = "IAgBBqrdYvf3hN04kt2HH+kFyC3H/p46Pm9iGk75Jn+ACRCc36GH"

# Set the environment variable within the Chef Infra Client process
ENV['ACR_PASSWORD'] = acr_password

# Set the environment variable in the user's profile (e.g., ~/.bashrc)
bash "set ACR_PASSWORD environment variable" do
  code <<-EOH
    echo 'export ACR_PASSWORD="#{acr_password}"' >> ~/.bashrc
  EOH
  action :run
end

ruby_block "verify ACR_PASSWORD environment variable" do
  block do
    Chef::Log.info("ACR_PASSWORD: #{ENV['ACR_PASSWORD']}")
    puts "ACR_PASSWORD: #{ENV['ACR_PASSWORD']}"
  end
  action :run
end

