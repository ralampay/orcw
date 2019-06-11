class CreateDownloadableFormsDownloadableForms < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_downloadable_forms do |t|
      t.string :title
      t.integer :file_id
      t.boolean :is_published
      t.integer :position
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-downloadable_forms"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/downloadable_forms/downloadable_forms"})
    end

    drop_table :refinery_downloadable_forms

  end

end
