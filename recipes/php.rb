package 'redis-server'

git "/vagrant/lib/predis" do
  repository "git://github.com:nrk/predis.git"
  reference "master"
  action :checkout
end

