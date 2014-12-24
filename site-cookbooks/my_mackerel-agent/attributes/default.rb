default['mackerel-agent']['conf']['apikey'] = 'Your API KEY' # required
default['mackerel-agent']['conf']['roles'] = ["My-Service:app"] # optional
default['mackerel-agent']['conf']['plugin.metrics.nginx'] = {
  'command' => '/usr/local/bin/mackerel-plugin-nginx -host localhost -port 80',
}
