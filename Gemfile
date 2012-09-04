source 'https://rubygems.org'

gemspec

gem 'refinerycms', :git => 'git://github.com/resolve/refinerycms.git'
gem 'refinerycms-i18n', :git => 'git://github.com/parndt/refinerycms-i18n.git'
gem 'refinerycms-settings', :git => 'git://github.com/parndt/refinerycms-settings.git'


group :development, :test do

  gem 'refinerycms-testing', :git => 'git://github.com/resolve/refinerycms.git'

  unless defined?(JRUBY_VERSION)
    gem 'sqlite3'
    gem 'mysql2'
    gem 'pg'
  end
end

# Refinery/rails should pull in the proper versions of these
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
