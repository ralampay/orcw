class AddShortDescriptionToRefineryArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_articles, :short_description, :string
  end
end
