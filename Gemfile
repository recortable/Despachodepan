source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'fog'
gem 'rmagick'
gem 'carrierwave' # 0.7.5 supports image?
#gem "paperclip", "~> 2.4"
gem 'jquery-rails'

gem 'acts_as_list'
gem 'decent_exposure'

gem 'inherited_resources'
gem 'kaminari'
gem 'has_scope'
gem 'responders'
gem 'RedCloth'

group :development do
  gem 'newrelic_rpm'
end


group :test, :development do
  # Pretty printed test output
  gem 'sqlite3'
  gem 'mysql2'
  gem 'mongrel', '1.2.0.pre2'
  gem 'test-unit'
  gem 'database_cleaner'
  gem 'turn', :require => false
  gem 'yaml_db'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "cucumber-rails", ">= 1.0.2"
end

group :production do
  gem 'mysql2'
end


