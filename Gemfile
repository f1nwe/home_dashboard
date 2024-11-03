# frozen_string_literal: true

source 'https://rubygems.org'

# Rails framework
gem 'rails', '~> 7.2.2'

# Core gems
gem 'bootsnap', require: false               # Reduces boot times through caching
gem 'faraday'                                # HTTP client library
gem 'importmap-rails'                        # JavaScript with ESM import maps
gem 'jbuilder'                               # Build JSON APIs with ease
gem 'pg', '~> 1.1'                           # PostgreSQL as the database for Active Record
gem 'puma', '>= 5.0'                         # Puma web server
gem 'sprockets-rails'                        # Asset pipeline for Rails
gem 'stimulus-rails'                         # Hotwire's modest JavaScript framework
gem 'turbo-rails'                            # Hotwire's SPA-like page accelerator

# Background job processing
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sidekiq-scheduler'

# Time zone support for Windows and JRuby
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'brakeman', require: false # Security analysis
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude' # Debugging Rails apps
  gem 'ostruct'                                                          # OpenStruct with a
  gem 'rubocop-rails-omakase', require: false                            # Ruby styling with RuboCop
end

group :development do
  gem 'annotate'
  gem 'web-console' # Console on exceptions pages
end

group :test do
end
