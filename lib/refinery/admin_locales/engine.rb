module Refinery
  module AdminLocales
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::AdminLocales

      engine_name :refinery_admin_locales

      initializer "register refinerycms_admin_locales plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "admin_locales"
          plugin.pathname = root
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.admin_locales_admin_admin_locales_path }
          plugin.menu_match = /refinery\/admin_locales/
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::AdminLocales)
      end
    end
  end
end
