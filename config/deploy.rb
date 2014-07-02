# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'todo-san'
set :repo_url, 'git@github.com:onjiro/todo-san.git'
set :rbenv_ruby, '2.0.0-p247'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Replace env dependent files'
  task :replace_settings do
    on roles(:app), in: :sequence do
      execute :cp, "#{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
      execute :cp, "#{deploy_to}/shared/config/secrets.yml #{release_path}/config/secrets.yml"
      execute :cp, "#{deploy_to}/shared/config/unicorn.rb #{release_path}/config/unicorn.rb"
      execute :echo, "$PATH"
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      execute :mkdir, "-p #{release_path}/tmp/pids"
      invoke 'unicorn:restart'
    end
  end

  after :updating, :replace_settings
  after :published, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
