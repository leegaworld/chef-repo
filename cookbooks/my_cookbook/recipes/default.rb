template "/etc/logrotate.conf" do
	source "logrotate.conf.erb"
	variables(
		how_often: "daily",
		keep: "31"
	)
end

template "/etc/backends.conf" do
	mode "0444"
	owner "root"
	group "root"
	variables(
		{
			:enabled => false,
			:backends => ["10.0.0.10","10.0.0.11","10.0.0.12"]
		}
	)
end

template "/etc/resolv.conf" do
	mode"0644"
	owner "root"
	group "root"
	variables(
		dns1: "168.126.63.1",
		dns2: "8.8.8.8"
	)
end

execute 'network_restart' do
	command 'service network restart'
end

include_recipe "yum"
yum_package 'wget' do
	action :install
end

execute 'pre_install' do
	command 'yum install -y gc gcc gcc-c++ pcre-devel zlib-devel make wget openssl-devel libxml2-devel libxslt-devel gd-devel perl-ExtUtils-Embed GeoIP-devel gperftools gperftools-devel libatomic_ops-devel perl-ExtUtils-Embed'
end

version = "1.3.9"
bash "install_nginx_from_source" do
	cwd Chef::Config['file_cache_path']
	code <<-EOH
		wget http://nginx.org/download/nginx-#{version}.tar.gz
		tar zxf nginx-#{version}.tar.gz &&
		cd nginx-#{version} &&
		./configure && make && make install
	EOH
	not_if "test -f /usr/local/nginx/sbin/nginx"
end
