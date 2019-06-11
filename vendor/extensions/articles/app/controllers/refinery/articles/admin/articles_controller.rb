module Refinery
  module Articles
    module Admin
      class ArticlesController < ::Refinery::AdminController

        crudify :'refinery/articles/article'

        private

        # Only allow a trusted parameter "white list" through.
        def article_params
          params.require(:article).permit(:title, :content, :banner_id, :is_published, :is_featured, :published_at, :position)
        end
      end
    end
  end
end
