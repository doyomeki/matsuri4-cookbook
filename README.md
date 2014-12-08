matsuri4-cookbook
=================

Cookbook for matsuri4

[![wercker status](https://app.wercker.com/status/7b626224a54dd9e5af976d9e960e1153/m "wercker status")](https://app.wercker.com/project/bykey/7b626224a54dd9e5af976d9e960e1153)

Overview
------

* create promotion site of matsuri4
* http://matsuri4.doyomeki.com

Description
------

* This cookbook are included mackerel-agent and fluentd and nginx

Requirement
-----

* ubuntu 14.04 LTS vagrant(ubuntu/trusy)
* Ruby 2.1.5
* bundler

Install
------


```
  $ git clone https://github.com/doyomeki/matsuri4-cookbook
  $ bundle install
  $ bundle exec berks vendor cookbooks
  $ vagrant plugin install sahara
  $ vagrant ssh-config --host webapp >> ~/.ssh/config
```

Usage
-----

### required

* mackerel-agent.conf
```
$ cat site-cookbooks/my_mackerel-agent/recipes/default.rb
node.default['mackerel-agent']['apikey'] = 'Your API KEY' # required
node.default['mackerel-agent']['conf']['roles'] = ["My-Service:app", "Another-Service:db"] # optional
```

* td-agent.conf

```
$ cat site-cookbooks/my_td-agent/templates/default/td-agent.conf.erb
  api_key ""  # your mackerel api key
  service ""  # your mackerel service name

```

### vagrant

```
 $ vagrant up
 # Start provisioning, after install Chef
 $ knife solo bootstrap webapp|| [IP ||  hostname]
```

Tips
------

## Use sahara

```
  $ vagrant sandbox on
  $ vagrant sandbox rollback
  $ vagrant sandbox off
```

## Use Chef-solo

```
  # Install Chef
  $ bundle exec knife solo prepare vagrant@webapp

  # provisionning cookbook
  $ bundle exec knife solo cook webapp

  # Start provisioning, after install Chef
  $ knife solo bootstrap [IP or hostname]

  # Not Start provisioning
  $ knife solo prepare [IP or hostname]
```

Contribution
------

Please fork.

```
 $ git clone https://github.com/user/matsuri4-cookbook.git
 $ bundle install
 $ bundle exec berks
 $ bundle exec berks vendor cookbooks
 $ vagrant plugin install sahara
 $ vagrant plugin install vagrant-omnibus
 $ vagrant plugin install vagrant-berkshelf
 $ vagrant ssh-config --host webapp >> ~/.ssh/config
```
