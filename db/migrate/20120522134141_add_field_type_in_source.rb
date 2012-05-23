class AddFieldTypeInSource < ActiveRecord::Migration
  def up
    add_column :sources, :type, :string, :null => false
  end

  def down
    remove_column :sources, :type
  end
end
