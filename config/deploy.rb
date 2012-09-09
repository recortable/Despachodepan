require "bundler/capistrano"
load 'deploy/assets'

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/config_files"
load "config/recipes/assets"
load "config/recipes/newrelic"

server "176.58.98.122", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "Despachodepan"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

# nginx stuff
set :server_names, 'despachodepan.com *.despachodepan.com'
set :nginx_page_caching, true

# newrelic settings
set :newrelic_license_key, '0a0d3776322392d64886579d8e72499290edd79a'

# config files settings
set :config_files, ['amazon_s3.yml', 'despachodepan.yml']

set :scm, "git"
set :repository, "git@github.com:recortable/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
