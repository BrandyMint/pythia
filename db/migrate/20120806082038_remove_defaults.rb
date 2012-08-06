class RemoveDefaults < ActiveRecord::Migration
  def change
    change_column :sources, :type, :string, :default => nil
    change_column :feeds, :source_id, :integer, :null => false

    add_index :feeds, :url, :unique => true
  end
end
