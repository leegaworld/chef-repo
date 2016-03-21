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
