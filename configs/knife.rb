# See http://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "andesm"
client_key               "#{current_dir}/andesm.pem"
validation_client_name   "flg-validator"
validation_key           "#{current_dir}/flg-validator.pem"
chef_server_url          'https://nobu.flg.jp/organizations/flg'
cache_type               'BasicFile'
cache_options( :path => "#{current_dir}/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
ssl_verify_mode          :verify_peer
verify_api_cert          :true	
syntax_check_cache_path  '#{current_dir}/syntax_check_cache'
knife[:secret_file] = "#{current_dir}/encrypted_data_bag_secret"
