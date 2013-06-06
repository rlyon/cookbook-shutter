name             "shutter"
maintainer       "Rob Lyon"
maintainer_email "rlyon@uidaho.edu"
license          "All rights reserved"
description      "Installs/Configures shutter"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"

%w{ redhat centos fedora }.each do |os|
  supports os
end
