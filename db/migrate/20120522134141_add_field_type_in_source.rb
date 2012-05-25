class AddFieldTypeInSource < ActiveRecord::Migration
  def up
    add_column :sources, :type, :string, :null => false, :default=>0
  end

  def down
    remove_column :sources, :type
  end
end
