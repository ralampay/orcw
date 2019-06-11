module Refinery
  module DownloadableForms
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::DownloadableForms

      engine_name :refinery_downloadable_forms

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "downloadable_forms"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.downloadable_forms_admin_downloadable_forms_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::DownloadableForms)
      end
    end
  end
end
