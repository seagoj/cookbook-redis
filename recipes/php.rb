package 'redis-server'
package 'git'

  execute "mkdir-lib" do
    not_if {File.exists?('/vagrant/lib')}
    command "mkdir /vagrant/lib"
  end

  git "/vagrant/lib/temp" do
    not_if {File.exists?('/vagrant/lib/predis')}
    repository "git://github.com/nrk/predis.git"
    reference "master"
    action :checkout
  end
  
  execute "mkdir-lib" do
    not_if {File.exists?('/vagrant/lib/predis')}
    command "mkdir /vagrant/lib/predis"
  end
  
  execute "copy-to-lib" do
    not_if {File.exists?('/vagrant/lib/predis')}
    command "mv -r /vagrant/lib/temp/lib/Predis /vagrant/lib"
  end
  
  execute "rm-temp" do
    not_if {!File.exists?('/vagrant/lib/temp')}
    command "rm -r /vagrant/lib/temp"
  end
