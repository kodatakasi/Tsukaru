source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'
gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem "puma", ">= 4.3.5"
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false
gem "nokogiri", ">= 1.10.8"
gem 'devise'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-facebook', '~> 4.0.0'
gem 'omniauth-line'
gem 'carrierwave'
gem 'mini_magick', '~> 4.8'
gem 'ransack'
gem 'bulma-rails'
gem 'i18n'
gem 'jquery-rails'
gem "kaminari", ">= 1.2.1"
gem 'devise-i18n'
gem 'devise-i18n-views'
gem "aws-sdk-s3", require: false
gem "json"
gem "rack"
gem "websocket-extensions"
gem "activesupport"
gem "actionpack", ">= 5.2.4.3"
gem "activestorage", ">= 5.2.4.3"
gem "actionview", ">= 5.2.4.3"


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'dotenv-rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
