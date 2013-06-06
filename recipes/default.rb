#
# Cookbook Name:: shutter
# Recipe:: default
#
# Copyright 2013, Rob Lyon
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

gem_package "shutter" do
  action :install
  version node[:shutter][:version]
end

directory "/etc/shutter.d" do
  mode 0755
  owner "root"
  group "root"
  action :create
end

template "/etc/shutter.d/iface.dmz" do
  source "iface.dmz.erb"
  mode 0600
  owner "root"
  group "root"
  variables({:iface_dmz => node[:shutter][:iface_dmz]})
  notifies :run, 'execute[shutter-restore]', :delayed
end

template "/etc/shutter.d/iface.forward" do
  source "iface.forward.erb"
  mode 0600
  owner "root"
  group "root"
  variables({:iface_forward => node[:shutter][:iface_forward]})
  notifies :run, 'execute[shutter-restore]', :delayed
end

ips = node[:shutter][:ip_allow]
if node[:shutter][:allow_source] == "databag"
  ips = data_bag_item('shutter', node[:shutter][:allow_bag])['ip_list']
end

template "/etc/shutter.d/ip.allow" do
  source "ip.allow.erb"
  mode 0600
  owner "root"
  group "root"
  variables({:ip_allow => ips})
  notifies :run, 'execute[shutter-restore]', :delayed
end

ips = node[:shutter][:ip_deny]
if node[:shutter][:deny_source] == "databag"
  ips = data_bag_item('shutter', node[:shutter][:deny_bag])['ip_list']
end

template "/etc/shutter.d/ip.deny" do
  source "ip.deny.erb"
  mode 0600
  owner "root"
  group "root"
  variables({:ip_deny => ips })
  notifies :run, 'execute[shutter-restore]', :delayed
end

template "/etc/shutter.d/ports.public" do
  source "ports.public.erb"
  mode 0600
  owner "root"
  group "root"
  variables({:ports_public => node[:shutter][:ports_public]})
  notifies :run, 'execute[shutter-restore]', :delayed
end

template "/etc/shutter.d/ports.private" do
  source "ports.private.erb"
  mode 0600
  owner "root"
  group "root"
  variables({:ports_private => node[:shutter][:ports_private]})
  notifies :run, 'execute[shutter-restore]', :delayed
end

execute "shutter-restore" do
  command "/usr/bin/shutter --restore --persist"
  action :nothing
end
