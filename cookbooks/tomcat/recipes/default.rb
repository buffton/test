#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'java-1.7.0-openjdk-devel'

group 'tomcat'

user 'tomcat' do
  manage_home false
  shell '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end

remote_file 'apache-tomcat-8.5.34.tar.gz' do
  source 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.tar.gz'
end

directory '/opt/tomcat' do
  action :create
  group 'tomcat'
end

execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'

execute 'chgrp -R tomcat /opt/tomcat/'

execute 'chmod -R g+r /opt/tomcat/conf'

execute 'chmod g+x /opt/tomcat/conf'

execute 'chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/'

template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
end

execute 'systemctl daemon-reload'

execute 'systemctl start tomcat'

execute 'systemctl status tomcat'

execute 'systemctl enable tomcat'
