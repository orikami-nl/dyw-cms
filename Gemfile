source "http://rubygems.org"

#gem 'rails', '3.1.0.beta1'
#gem 'sprockets', '2.0.0.beta.2'
gem 'rails', '3.1.0.rc1'
gem 'sprockets', :git => 'git://github.com/sstephenson/sprockets.git'

gem 'rake', '~> 0.8.7'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'
gem 'therubyracer-heroku'

gem 'simple_form'

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

group :development do
	gem 'therubyracer'
	gem 'sqlite3'
end
