source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'

gem 'devise'

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'haml-rails'

gem 'jquery-rails'
gem 'underscore-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.43'
gem 'gmaps4rails'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'byebug', platform: :mri
end

group :test do
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
