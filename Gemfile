source 'https://rubygems.org'
source 'https://gem.fury.io/engineerai'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'dotenv-rails', groups: [:development, :test]
ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'pry-rails', '~> 0.3.9'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "letter_opener", group: :development
group :development, :test do
  gem 'rspec-rails', '5.1.2'
  gem 'rspec-sonarqube-formatter', '1.5.0'
  gem 'simplecov', '0.17'
  gem 'simplecov-json', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger conpe
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'shoulda-callback-matchers'
end

group :development do

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bx_block_paypal-0541df80', '0.0.5', require: 'bx_block_paypal'
gem 'bx_block_login-3d0582b5', '0.0.10', require: 'bx_block_login'
gem 'account_block', '0.0.30'
gem 'bx_block_sms', '0.0.5'
gem 'bx_block_payments', '0.1.7'
gem 'bx_block_forgot_password-4de8968b', '0.0.6', require: 'bx_block_forgot_password'
gem 'bx_block_catalogue-0e5da613', '0.0.8', require: 'bx_block_catalogue'
gem 'bx_block_categories-acd0763f', '0.0.9', require: 'bx_block_categories'
gem 'bx_block_admin', '0.0.15'
gem 'bx_block_roles_permissions-c50949d0', '0.0.6', require: 'bx_block_roles_permissions'
gem 'bx_block_automatic_renewals-0b2de503', '0.0.5', require: 'bx_block_automatic_renewals'
gem 'bx_block_custom_user_subs', '0.0.9'
gem 'bx_block_payment_admin', '0.0.2'
gem 'bx_block_settings-5412d427', '0.0.3', require: 'bx_block_settings'
gem 'bx_block_scheduling-d1f08754', '0.0.3', require: 'bx_block_scheduling'
gem 'bx_block_calendar-4836ef12', '0.0.4', require: 'bx_block_calendar'
gem 'bx_block_appointment_management-eb816fd3', '0.0.7', require: 'bx_block_appointment_management'
gem 'builder_base', '0.0.53'

group :test do
  gem 'mock_redis', '0.34.0'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'capybara'
end

gem 'sidekiq_alive'
gem 'sidekiq', '~> 6.1.0'

gem "yabeda-prometheus"    # Base
gem "yabeda-rails"         #API endpoint monitoring
gem "yabeda-http_requests" #External request monitoring
gem "yabeda-puma-plugin"
gem 'yabeda-sidekiq'

gem 'bx_block_cors'
gem 'devise'
gem 'sassc-rails'
gem 'activeadmin'
gem 'active_admin_role'
gem 'activeadmin_json_editor'
gem 'active_admin_datetimepicker'
gem 'rack-cors'
gem 'redis', '~> 4.8.0'
gem 'arctic_admin'
gem 'activeadmin_addons'
gem 'sidekiq-cron'