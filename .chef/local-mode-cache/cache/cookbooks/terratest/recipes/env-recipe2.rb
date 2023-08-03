# Export the ACR_PASSWORD environment variable
ruby_block "set ACR_PASSWORD environment variable" do
  block do
    ENV['ACR_PASSWORD'] = 'IAgBm9iGk75Jn+ACRCc36GH'
  end
  action :run
end

# Execute the `source ~/.bashrc` command to update the environment
bash "source_bashrc" do
  code "source ~/.bashrc"
  action :run
end

# Verify the environment variable (log the value in the Chef log)
ruby_block "verify ACR_PASSWORD environment variable" do
  block do
    Chef::Log.info("ACR_PASSWORD: #{ENV['ACR_PASSWORD']}")
  end
  action :run
end

