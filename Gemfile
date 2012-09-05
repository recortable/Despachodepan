source 'http://rubygems.org'

gem 'rails', '>= 3.2.2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'fog'
gem 'rmagick'
#gem 'mini_magick'
gem 'carrierwave'
gem 'jquery-rails'

gem 'acts_as_list'
gem 'decent_exposure'
gem 'simple_form'
gem 'redcarpet'
gem "friendly_id", "~> 4.0.0"
gem 'will_paginate', '~> 3.0'


gem 'hoptoad_notifier'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'sqlite3'
#  gem 'thin'
end

group :production, :development do
  gem 'newrelic_rpm'
#  gem 'mysql2'
  gem 'pg'
end

group :test, :development do
  # Pretty printed test output
  gem 'rspec-rails'
  #  gem 'mongrel', '1.2.0.pre2'
  gem 'yaml_db'
end

group :test do
  gem 'database_cleaner'
  gem 'turn', :require => false
  gem 'spork', '~> 1.0rc'
#  gem "cucumber-rails", ">= 1.0.2"
  gem "factory_girl_rails", "~> 1.2"
end



