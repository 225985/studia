source 'https://rubygems.org'

gem 'rails', '3.2.2'

group :development do
  gem 'sqlite3', :platform => :ruby
  gem 'activerecord-jdbcsqlite3-adapter', :platform => :jruby
end

group :production do
  gem 'pg', '0.12.2'
end

gem 'thin', :platform => :mri
gem 'jruby-openssl', :platform => :jruby
gem 'json'
gem 'devise'
gem 'omniauth-facebook'
gem 'haml'
gem 'haml-rails'
gem 'simple_form'
gem 'multi_json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'execjs'
  gem 'therubyracer', :platforms => :ruby
  gem 'therubyrhino', :platforms => :jruby
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
