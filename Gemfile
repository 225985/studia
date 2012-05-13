source 'https://rubygems.org'

gem 'rails', '3.2.2'

group :development, :test do
  gem 'pry-rails'
  gem "rspec-rails"
  gem 'sqlite3', :platform => :ruby # gem do obsługi bazy danych sqlite
  gem 'activerecord-jdbcsqlite3-adapter', :platform => :jruby # gem do obsługi bazy danych sqlite jruby
  gem "rails-erd" # generowanie diagramów
end

group :production do
  gem 'pg', '0.12.2' # gem do obsługi bazy danych Postgres
end

gem 'thin', :platform => :mri
gem 'jruby-openssl', :platform => :jruby
gem 'json'
gem 'devise' # gem do obsługi autentykacji użytkowników
gem 'omniauth-facebook' # gem do obsługi logowania przez FB przy pomocy OAuth
gem 'haml' # gem pozwaljący na wykorzystanie języka znaczników HAML
gem 'haml-rails'
gem 'simple_form' # gem pozwalający na proste tworzenie formularzy
gem 'multi_json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'execjs'
  gem 'therubyracer', :platforms => :ruby
  gem 'therubyrhino', :platforms => :jruby
  gem 'sass-rails'
  gem 'coffee-rails' # gem pozwalający na pisanie javascript w języku CoffeScript
  gem 'uglifier'
end

gem 'jquery-rails' # automatyczne ładowanie biblioteki js jQuery
gem 'jqueryui_rails' # automatyczne ładowanie biblioteki js jQuery-ui

