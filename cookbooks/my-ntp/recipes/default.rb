include_recipe 'ntp::ntpdate'
resources("template[/etc/default/ntpdate]").cookbook "my-ntp"
