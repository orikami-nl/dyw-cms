# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "cms"
  s.summary = "Insert Cms summary."
  s.description = "Insert Cms description."
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.1"
  s.add_dependency 'rails', '>= 3.0.0'

	s.add_development_dependency "therubyracer"
	s.add_development_dependency "sqlite3"
	s.add_test_dependency "therubyracer"
	s.add_test_dependency "sqlite3"
	s.add_test_dependency "capybara"
	s.add_test_dependency "factory_girl_rails"
	s.add_test_dependency "cucumber-rails"
	s.add_test_dependency "rspec-rails"
	s.add_test_dependency "database_cleaner"
	s.add_dependency "sprockets", "2.0.0.beta.10"
	s.add_dependency "rails", "3.1.0.rc3"
	s.add_dependency "rake", "~> 0.8.7"
	s.add_dependency 'sass'
	s.add_dependency 'json'
	s.add_dependency 'coffee-script'
	s.add_dependency 'uglifier'
	s.add_dependency 'jquery-rails'
	s.add_dependency 'therubyracer-heroku'
	s.add_dependency 'simple_form'
end
