# FreeBSD
namespace :env do
  task :production => [:environment] do
    set :domain,              'gurfoto.ru'
    set :deploy_to,           '/home/user/projects/gurphoto'
    set :repository, 'https://bitbucket.org/alexesDev/emerald-world'
    set :sudoer,              'user'
    set :user,                'user'
    set :group,               'user'
    set :rvm_path,            '/home/user/.rvm/bin/rvm'   # we don't use that. see below.
    set :rvm_string,          '1.9.3'
    set :services_path,       '/etc/init.d'          # where your God and Unicorn service control scripts will go
    set :nginx_path,          '/usr/sbin/nginx'
    set :deploy_server,       'production'                   # just a handy name of the server
    invoke :defaults                                         # load rest of the config
    invoke :"rvm:use[#{rvm_string}]"                       # since my prod server runs 1.9 as default system ruby, there's no need to run rvm:use
  end
end
