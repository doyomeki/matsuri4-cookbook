matsuri4-cookbook
=================

Cookbook for matsuri4

Overview
------

Description
------

Install
------


```
  $ git clone https://github.com/doyomeki/matsuri4-cookbook
  $ bundle install
  $ bundle exec berks vendor cookbooks
  $ vagrant plugin install dotenv
  $ vagrant plugin install sahara
  $ vagrant plugin install vagrant-omnibus
  $ vagrant plugin install vagrant-berkshelf
  $ vagrant ssh-config --host webapp >> ~/.ssh/config
```

Usage
-----

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
  $ knife solo prepare vagrant@webapp

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
 $ vagrant plugin install dotenv
 $ vagrant plugin install sahara
 $ vagrant plugin install vagrant-omnibus
 $ vagrant plugin install vagrant-berkshelf
 $ vagrant ssh-config --host webapp >> ~/.ssh/config
```
