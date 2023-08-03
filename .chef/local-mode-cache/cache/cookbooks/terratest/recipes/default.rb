#
# Cookbook:: terratest
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.
include_recipe "terratest::env-recipe"
include_recipe "terratest::go-recipe"
include_recipe "terratest::terraform-recipe"
include_recipe "terratest::git-clone-recipe"

