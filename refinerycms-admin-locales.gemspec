# Encoding: UTF-8

$:.push File.expand_path('../lib', __FILE__)
require 'refinery/admin_locales/version'
version = Refinery::AdminLocales::Version.to_s

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-admin-locales}
  s.version           = version
  s.description       = %q{Manage locale for each user in the refinerycms admin.}
  s.summary           = %q{Admin Locales extension for Refinery CMS.}
  s.email             = %q{ruben@simplelogica.net}
  s.authors           = ['Simplelógica','Rubén Sierra']
  s.homepage          = %q{http://simplelogica.net/}
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',     '~> 1.0.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing',     '~> 1.0.0'
end
