source "http://rubygems.org"

gem 'jquery-rails'

group :development do
  gem 'simple_form'
  gem 'carrierwave'
end

if RUBY_VERSION < '1.9'
  gem "ruby-debug", ">= 0.10.3"
end

group :test do
	gem 'therubyracer'
	gem 'sqlite3'
	gem "capybara"
	gem "factory_girl_rails"
	gem "cucumber-rails"
	gem "rspec-rails"
	gem "database_cleaner"
end

gemspec
