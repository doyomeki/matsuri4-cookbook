template "#{node['nginx']['dir']}/sites-available/default" do
  source 'default-site.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end

template "#{node['nginx']['dir']}/sites-available/app" do
  source 'app-site.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end

## TODO site-enabled symboliclink
link "#{node['nginx']['dir']}/sites-enabled/default" do
  not_if do
    ::File.symlink?("#{node['nginx']['dir']}/sites-enabled/default")
  end
  to "#{node['nginx']['dir']}/sites-available/default"
  notifies :reload, 'service[nginx]'
end

link "#{node['nginx']['dir']}/sites-enabled/app" do
  not_if do
    ::File.symlink?("#{node['nginx']['dir']}/sites-enabled/app")
  end
  to "#{node['nginx']['dir']}/sites-available/app"
  notifies :reload, 'service[nginx]'
end

directory "/var/www" do
  owner 'nginx'
  group 'nginx'
  mode 0755
  action :create
end

## TODO install git and curl
%w{git curl}.each do |pkg|
  package pkg do
    action :install
  end
end


git "/var/www/app" do
  repository node["my_nginx"]["matsuri4_url"]
  action :sync
  revision node["my_nginx"]["branch"]
  user "nginx"
  group "nginx"
end
