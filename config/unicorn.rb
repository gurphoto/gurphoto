worker_processes 1
working_directory "/home/user/projects/gurphoto/"

preload_app true

timeout 30

listen "/home/user/projects/gurphoto/tmp/sockets/unicorn.sock", :backlog => 64

pid "/home/user/projects/gurphoto/tmp/pids/unicorn.pid"

stderr_path "/home/user/projects/gurphoto/log/unicorn.stderr.log"
stdout_path "/home/user/projects/gurphoto/log/unicorn.stdout.log"

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end
