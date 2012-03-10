require 'bundler/capistrano'
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, "1.9.2"
set :rvm_type, :user

set :application, "ticketee"
set :repository,  "git://github.com/mgswolf/ticketee.git"
set :domain, "177.71.186.150"
ssh_options[:keys] = ["#{ENV['HOME']}/AWS/defindex.pem"]

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
role :db,  domain

set :user, "ubuntu"
set :deploy_to, "/home/ubuntu/#{application}"

set :use_sudo, false

set :keep_releases, 5

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
  namespace :deploy do
    task :start do ; end
    task :stop do ; end
    task :restart, :roles => :app, :except => { :no_release => true } do
      run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    end
  end

  task :symlink_database_yml do
    run "rm #{release_path}/config/database.yml"
    run "ln -sfn #{shared_path}/config/database.yml
         #{release_path}/config/database.yml"
  end

  after "bundle:install", "symlink_database_yml"
