class AddIsFeaturedToRefineryArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_articles, :is_featured, :boolean
  end
end
