#default['my_cookbook2']['message'] = 'hello world!'
default['my_cookbook2']['message'] = "#{node['my_cookbook2']['hi']} #{node['my_cookbook2']['world']}!"
