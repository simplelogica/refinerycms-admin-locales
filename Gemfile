source 'https://rubygems.org'

gem 'refinerycms', '~>2.0.0'
gem 'refinerycms-i18n', '~>2.0.0'

group :development, :test do

  gem 'refinerycms-testing', '~>2.0.0'

  unless defined?(JRUBY_VERSION)
    group :development, :test do
  gem 'sqlite3'
end
    gem 'mysql2'
    # gem 'pg'
  end
end

# Refinery/rails should pull in the proper versions of these
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
