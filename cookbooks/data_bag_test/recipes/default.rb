node.default['authorization']['sudo']['passwordless'] = true
node.default['authorization']['sudo']['groups'] = ['staff','vagrant']

include_recipe 'sudo'
