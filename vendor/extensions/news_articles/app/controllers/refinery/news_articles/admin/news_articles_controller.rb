module Refinery
  module NewsArticles
    module Admin
      class NewsArticlesController < ::Refinery::AdminController

        crudify :'refinery/news_articles/news_article'

        private

        # Only allow a trusted parameter "white list" through.
        def news_article_params
          params.require(:news_article).permit(:title, :content, :date, :is_published)
        end
      end
    end
  end
end
