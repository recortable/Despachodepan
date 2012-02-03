source 'http://rubygems.org'

gem 'rails', '3.2.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'fog'
gem 'rmagick'
gem 'carrierwave'
gem 'jquery-rails'

gem 'acts_as_list'
gem 'decent_exposure'
gem 'simple_form'

gem 'inherited_resources'
gem 'kaminari'
gem 'has_scope'
gem 'responders'
gem 'RedCloth'

gem 'newrelic_rpm', group: [:production, :development]

gem 'sqlite3', require: 'sqlite3', group: [:production, :development]
gem 'mysql2', group: [:production, :development]

group :production do
  gem 'unicorn'
end

group :development do
  gem 'capistrano'
#  gem 'thin'
end

group :test, :development do
  # Pretty printed test output
  gem 'rspec-rails'
  #  gem 'mongrel', '1.2.0.pre2'
  gem 'yaml_db'
end

group :test do
 gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'turn', :require => false
#  gem "cucumber-rails", ">= 1.0.2"
  gem 'ruby-debug19', :require => 'ruby-debug'
end



