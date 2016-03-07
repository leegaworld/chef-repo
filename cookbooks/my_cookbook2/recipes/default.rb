message = node['my_cookbook2']['message']
Chef::Log.info("** Saying what I was told to say: #{message}")

template '/tmp/fqdn' do
  source 'fqdn.erb'
  variables(
    fqdn:node['fqdn']
  )
end


template '/tmp/message' do
  source 'message.erb'
  variables(
    hi: 'Hallo',
    world: 'Welt',
    from: node['fqdn']
  )
end
