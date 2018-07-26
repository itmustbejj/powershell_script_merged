#
# Cookbook:: powershell_script_merged_provider
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

powershell_script "mkdir test_dir" do
  code "mkdir test_dir"
  cwd Chef::Config[:file_cache_path]
  user "username"
  password "password"
  provider Chef::Providers::PowershellScriptMergedFlags
end
