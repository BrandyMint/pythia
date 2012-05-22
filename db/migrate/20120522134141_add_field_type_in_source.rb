class AddFieldTypeInSource < ActiveRecord::Migration
  def up
    add_column :sources, :type, :string
  end

  def down
  end
end
