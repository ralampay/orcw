class CreateArticlesArticles < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_articles do |t|
      t.string :title
      t.text :content
      t.integer :banner_id
      t.boolean :is_published
      t.boolean :is_featured
      t.date :published_at
      t.integer :position
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
