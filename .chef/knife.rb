# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "acherlyonok"
client_key               "#{current_dir}/acherlyonok.pem"
chef_server_url          "https://chef-server/organizations/acsun"
cookbook_path            ["#{current_dir}/../cookbooks"]

# current_dir = File.dirname(__FILE__)
# log_level                :info
# log_location             STDOUT
# validation_client_name   'chef-validator'
# validation_key           "#{current_dir}/#{validation_client_name}.pem"
# chef_server_name         'chef-server'
# chef_server_url          "https://#{chef_server_name}"
# node_name                'chef-node1'
# client_key               "#{current_dir}/#{node_name}.pem"
# chef_node_url            "#{chef_server_url}/organizations/#{node_name}"
# cookbook_path            "#{current_dir}/../cookbooks"
# syntax_check_cache_path  "#{current_dir}/syntax_check_cache"
