# This migration comes from refinery_articles (originally 1)
class CreateArticlesArticles < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_articles do |t|
      t.string :title
      t.integer :banner_id
      t.text :content
      t.date :published_at
      t.boolean :is_published
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-articles"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/articles/articles"})
    end

    drop_table :refinery_articles

  end

end
