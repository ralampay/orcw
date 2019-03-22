class CreateEventsEvents < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_events do |t|
      t.string :title
      t.string :description
      t.date :date_of_event
      t.date :published_at
      t.boolean :is_published
      t.string :external_link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/events"})
    end

    drop_table :refinery_events

  end

end
