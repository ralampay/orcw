# This migration comes from refinery_policy_files (originally 1)
class CreatePolicyFilesPolicyFiles < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_policy_files do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-policy_files"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/policy_files/policy_files"})
    end

    drop_table :refinery_policy_files

  end

end
