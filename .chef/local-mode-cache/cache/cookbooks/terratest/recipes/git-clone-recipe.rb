#
# Cookbook:: terratest
# Recipe:: git-clone-recipe
#
# Copyright:: 2023, The Authors, All Rights Reserved.
# Your cookbook name (change this to the appropriate name)
#cookbook_name = 'my_cookbook'
# Your cookbook name (change this to the appropriate name)
cookbook_name = 'my_cookbook'

# The parent directory where you want to create the new folder and clone the repository
parent_directory = '/home/azureuser/chef/chef-repo/cookbooks'

# The name of the new folder to be created
new_folder_name = 'go-function'

# The directory where you want to clone the repository
repo_directory = "#{parent_directory}/#{new_folder_name}"

# The public repository URL
repo_url = 'https://github.com/muzakkirsaifi123/knolx-checking-images-inACR'

# The Go module name
go_module_name = 'github.com/knolx'

# Create the new folder
directory repo_directory do
  recursive true
end

# Clone the public repository
git repo_directory do
  repository repo_url
  action :sync
end

# Change directory to the repository and run Go commands
bash 'run_go_commands' do
  cwd repo_directory
  code <<-EOH
    # Run 'go mod init knolx'
    go mod init #{go_module_name}

    # Run 'go mod tidy'
    go mod tidy

    # Run 'go run .'
    go run .
  EOH
end

