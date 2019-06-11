module Refinery
  module PolicyFiles
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PolicyFiles

      engine_name :refinery_policy_files

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "policy_files"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.policy_files_admin_policy_files_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PolicyFiles)
      end
    end
  end
end
