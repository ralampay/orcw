require 'refinerycms-core'

module Refinery
  autoload :NewsArticlesGenerator, 'generators/refinery/news_articles_generator'

  module NewsArticles
    require 'refinery/news_articles/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
