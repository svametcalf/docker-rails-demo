namespace :docker do
  task :startup do
    sh "/usr/local/bin/wait-for-it.sh db:5432 -t 10 -- ./startserver.sh"
  end
end
