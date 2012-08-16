# Admin Locales extension for Refinery CMS.

## Description

  This extension adds a locale attribute to dashboard users
and a tab to change this locale in each user.

  The dashboard locale will allways load the user locale instead the selected locale
in the views. If the user hasn't locale, the find locale method used will be the default
refinery method.

  This solves the locale dashboard conflicts with multiple users want different locales
at the same time

## How to add this extension to your project

### Refinery 2:

#### Add gem to Gemfile
    gem 'refinerycms-admin-locales', '2.0', :git => 'git_repo/refinerycms-admin-locales'

#### Install extension
    rake refinery_admin_locales:install:migrations
    rake db:migrate


### Refinery 1:

#### Add gem to Gemfile
    gem 'refinerycms-admin-locales', '1.0', :git => 'git_repo/refinerycms-admin-locales', :branch => 'refinerycms1'

#### Install extension
    rails generate refinerycms_admin_locales
    rake db:migrate

## How to build this extension as a gem

    gem build refinerycms-admin-locales.gemspec
    gem install refinerycms-admin-locales.gem

    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push refinerycms-admin-locales.gem
