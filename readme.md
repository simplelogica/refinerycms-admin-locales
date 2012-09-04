# Admin Locales extension for Refinery CMS.

## Description

  This extension adds a locale attribute to dashboard users
and a tab to change this locale in each user.

  The dashboard locale will allways load the user locale instead the selected locale
in the views. If the user hasn't locale, the find locale method used will be the default
refinery method.

  This refinery extension solves the locale dashboard conflicts with multiple
users who need different locales at the same time.

## How to add this extension to your project

### Refinery 2:

#### Add gem to Gemfile
    gem 'refinerycms-admin-locales'

#### Install extension
    rake refinery_admin_locales:install:migrations
    rake db:migrate


### Refinery 1:

#### Add gem to Gemfile
    gem "refinerycms-admin-locales", "~> 1.0.0"

#### Install extension
    rails generate refinerycms_admin_locales
    rake db:migrate

**WARNING: Refinary 1 version, is not test, but it should work**
