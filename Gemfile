source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'fast_jsonapi'
gem 'jwt'
gem 'kaminari'
gem 'pg', '>= 0.18', '< 2.0'
gem 'prawn'
gem 'prawn-table'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'uncouple', '>=0.2.2', require: 'uncouple/rails'
gem 'whenever'

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', '~> 0.88.0'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
