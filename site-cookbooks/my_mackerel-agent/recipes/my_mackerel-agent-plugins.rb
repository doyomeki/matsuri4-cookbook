package "mackerel-agent-plugins" do
  action :install
end

template "mackerel-agent.conf" do
  path "/etc/mackerel-agent/mackerel-agent.conf"
  source "mackerel-agent.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[mackerel-agent]'
end

