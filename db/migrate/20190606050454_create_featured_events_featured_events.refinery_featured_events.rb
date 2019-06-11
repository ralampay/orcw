# This migration comes from refinery_featured_events (originally 1)
class CreateFeaturedEventsFeaturedEvents < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_featured_events do |t|
      t.string :title
      t.string :subtext
      t.datetime :date
      t.integer :photo_id
      t.text :blurb
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-featured_events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/featured_events/featured_events"})
    end

    drop_table :refinery_featured_events

  end

end
