package 'redis-server'
package 'git'

directory "/vagrant/lib" do
  not_if {File.exists?("/vagrant/lib")}
  owner   node[:redis][:user]
  group   node[:redis][:group]
end

#execute "mkdir-lib" do
#  not_if {File.exists?('/vagrant/lib')}
#  command "mkdir /vagrant/lib"
#end

git "/vagrant/lib/temp" do
  not_if {File.exists?('/vagrant/lib/predis')}
  repository "git://github.com/nrk/predis.git"
  reference "master"
  action :checkout
end

directory "/vagrant/lib/predis" do
  not_if {File.exists?("/vagrant/lib/predis")}
  owner node[:redis][:user]
  group node[:redis][:group]
end
  
#execute "mkdir-lib" do
#  not_if {File.exists?('/vagrant/lib/predis')}
#  command "mkdir /vagrant/lib/predis"
#end
  
execute "copy-to-lib" do
  not_if {File.exists?('/vagrant/lib/predis')}
  command "cp -r /vagrant/lib/temp/lib/Predis /vagrant/lib"
end

directory "/vagrant/lib/temp" do
  not_if {!File.exists?("/vagrant/lib/temp")}
  recursive true
  action :remove
end

#execute "rm-temp" do
#  not_if {!File.exists?('/vagrant/lib/temp')}
#  command "rm -r /vagrant/lib/temp"
#end
