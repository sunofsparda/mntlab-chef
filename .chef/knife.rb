current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
validation_client_name   'chef-validator'
validation_key           "#{current_dir}/chef-validator.pem"
client_key               "#{current_dir}/chef-node1.pem"
node_name                'chef-node1'
chef_server_url          "https://192.168.100.101/organizations/#{node_name}"
cookbook_path            "#{current_dir}/../cookbooks"
syntax_check_cache_path  "#{current_dir}/syntax_check_cache"
