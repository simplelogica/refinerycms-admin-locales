require 'refinery'

module Refinery
  module AdminLocales
    class << self
      attr_accessor :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def version
        ::Refinery::AdminLocales::Version.to_s
      end
    end

    class Engine < Rails::Engine

     config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_admin_locales"
          plugin.pathname = root
          plugin.url = { :controller => '/admin/admin_locales', :action => 'index' }
          plugin.menu_match = /(admin|refinery)\/admin_locales$/
        end
      end

      config.to_prepare do
        ::Admin::BaseController.class_eval do
          def find_or_set_locale_with_default
            if current_user && current_user.locale
              ::Refinery::I18n.current_locale = current_user.locale
              ::I18n.locale = ::Refinery::I18n.current_locale
            else
              find_or_set_locale_without_default
            end
          end

          alias_method_chain :find_or_set_locale, :default
        end
      end
    end
  end
end
