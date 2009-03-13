desc "Restart Application"
namespace :passenger do
  task :restart do
    puts `touch tmp/restart.txt`
  end
end
