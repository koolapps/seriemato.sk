source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', :git => 'https://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => 'master'
gem 'high_voltage'
gem 'paperclip'
gem 'email_validator'
gem 'haml'

group :test, :development do
  gem 'rspec-rails'
  gem 'spork-rails', git: 'https://github.com/sporkrb/spork-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'faker'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'debugger'
  # gem 'rack-mini-profiler'
end

group :test do
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
  gem 'aws-sdk'
end
