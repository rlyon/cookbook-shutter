#
# Cookbook Name:: shutter
# Attributes:: default
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

default[:shutter][:version] = '0.2.0'
default[:shutter][:iface_dmz] = []
default[:shutter][:iface_forward] = []
default[:shutter][:ip_allow] = [
  '192.168.0.0/16'
]
default[:shutter][:ip_deny] = []
default[:shutter][:ports_private] = [
  '22 tcp'
]
default[:shutter][:ports_public] = []
default[:shutter][:allow_source] = "attributes"
default[:shutter][:allow_bag] = "allow_private"
default[:shutter][:deny_source] = "attributes"
default[:shutter][:deny_bag] = "deny_bastards"