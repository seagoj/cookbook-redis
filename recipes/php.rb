package 'redis-server'
package 'git'

  execute "mkdir-lib" do
    not_if {File.exists?('/vagrant/lib')}
    command "mkdir /vagrant/lib"
  end

  git "/vagrant/lib/predis" do
    not_if {File.exists?('/vagrant/lib/predis')}
    repository "git://github.com/nrk/predis.git"
    reference "master"
    action :checkout
  end
