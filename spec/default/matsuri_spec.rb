require 'spec_helper'

# Check Nginx
describe package('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

# Check Mackerel
describe package('mackerel-agent') do
  it { should be_installed }
end

describe service('mackerel-agent') do
  it { should be_enabled }
#  it { should be_running } Please setting apikey
end

describe file('/etc/mackerel-agent/mackerel-agent.conf') do
  it { should be_file }
end

# Check td-agent
describe package('td-agent') do
  it { should be_installed }
end

describe service('td-agent') do
  it { should be_enabled }
#  it { should be_running } Please setting apikey
end

describe file('/etc/td-agent') do
  it { should be_a_directory }
end

describe file('/etc/td-agent/td-agent.conf') do
  it { should be_a_file }
  it { should be_mode 644 }
end

describe file('/etc/td-agent/conf.d') do
  it { should be_a_directory }
  it { should be_mode 755 }
end

# Check td-agent plugin
describe package('fluent-plugin-mackerel') do
  it { should_not be_installed.by('gem') }
end
describe package('fluent-plugin-datacounter') do
  it { should_not be_installed.by('gem') }
end

