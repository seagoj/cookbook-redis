package 'redis-server'

if !File.exists('/vagrant/lib')
  execute "mkdir-lib" do
    command "mkdir /vagrant/lib"
  end
end

if !File.exists('/vagrant/predis')
  git "/vagrant/predis" do
    repository "git://github.com/nrk/predis.git"
    reference "master"
    action :checkout
  end
end
