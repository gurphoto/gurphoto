namespace :fixtures do
  task :dump do
    ActiveRecord::Base.establish_connection :development
    puts ActiveRecord::Base.connection.tables
  end
end
