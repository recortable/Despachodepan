source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'fog'
gem 'rmagick'
gem 'carrierwave'
gem 'jquery-rails'

gem 'acts_as_list'
gem 'decent_exposure'

gem 'inherited_resources'
gem 'kaminari'
gem 'has_scope'
gem 'responders'
gem 'RedCloth'

group :production do
  gem 'mysql2'
end

group :development do
  gem 'mysql2'
  gem 'newrelic_rpm'
end

group :test, :development do
  # Pretty printed test output
  gem 'rspec-rails'
#  gem 'mongrel', '1.2.0.pre2'
  gem 'yaml_db'
end

group :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'turn', :require => false
  gem "cucumber-rails", ">= 1.0.2"
  gem 'ruby-debug19', :require => 'ruby-debug'
end



