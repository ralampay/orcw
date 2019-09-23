module Refinery
  module NewsArticles
    class NewsArticlesController < ::ApplicationController

      before_action :find_all_news_articles
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @news_article in the line below:
        present(@page)
      end

      def show
        @news_article = NewsArticle.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @news_article in the line below:
        present(@page)
      end

    protected

      def find_all_news_articles
        @news_articles = NewsArticle.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/news_articles").first
      end

    end
  end
end
