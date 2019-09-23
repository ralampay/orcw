# This migration comes from refinery_news_articles (originally 1)
class CreateNewsArticlesNewsArticles < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_news_articles do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.boolean :is_published
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-news_articles"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/news_articles/news_articles"})
    end

    drop_table :refinery_news_articles

  end

end
