class AddFieldsSubscribeId < ActiveRecord::Migration
  def up
    add_column :feeds, :source_id, :integer, :default=>0, :null => false 
  end
  
  def down
    remove_column :feeds, :source_id
  end
end