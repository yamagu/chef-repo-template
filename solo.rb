# https://gist.github.com/4434030/3cd686da458b7229634ea50000c96317ada0e1b7

knife[:solo_path] = 'chef-solo'

solo_path = ENV['KNIFE_SOLO'] ? knife[:solo_path] : File.expand_path(File.dirname(__FILE__))

data_bag_path             File.join(solo_path, 'data_bags')
encrypted_data_bag_secret File.join(solo_path, 'data_bag_key')
cookbook_path             [ File.join(solo_path, "site-cookbooks"),
                            File.join(solo_path, "vendor/cookbooks") ]
role_path                 File.join(solo_path, "roles")
