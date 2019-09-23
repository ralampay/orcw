module Refinery
  module NewsArticles
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::NewsArticles

      engine_name :refinery_news_articles

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "news_articles"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.news_articles_admin_news_articles_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::NewsArticles)
      end
    end
  end
end
