class AddFieldsSubscribeId < ActiveRecord::Migration
  def up
    add_column :sources, :subscribe_id, :integer, :default =>1, :null => false
  end
  def down
    remove_column :sources, :subscribe_id
  end
end