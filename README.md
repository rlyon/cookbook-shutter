# shutter cookbook
Sets up the shutter firewall tool.

# Requirements
- CentOS 5+
- Chef 11
- Ruby and Rubygems

# Usage
Include recipe[shutter] in your run_list

# Attributes
default[:shutter][:version] - The version of shutter to install
default[:shutter][:iface_dmz] - Interfaces that are always allowed
default[:shutter][:iface_forward] - Interfaces to forward traffic over
default[:shutter][:ip_allow] - IP addresses that are allowed to access private ports
default[:shutter][:ip_deny] - IP addresses that are not allowed to public or private ports
default[:shutter][:ports_private] - Ports that are accessible to private ips
default[:shutter][:ports_public] - Ports that are accessible to all
default[:shutter][:allow_source] - Source for allowed IP addresses, either 'attributes' or 'databag'
default[:shutter][:allow_bag_item] - If a databag is the source, use this item for allowed IP addresses 
default[:shutter][:deny_source] - Source for denied IP addresses, either 'attributes' or 'databag'
default[:shutter][:deny_bag] - If a databag is the source, use this item for denied IP addresses

# Recipes
default.rb
- Install and configure shutter from a gem

# Author

Author:: Rob Lyon (rlyon@uidaho.edu)
