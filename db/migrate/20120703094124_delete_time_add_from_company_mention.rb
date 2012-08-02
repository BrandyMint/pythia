# coding: utf-8
class DeleteTimeAddFromCompanyMention < ActiveRecord::Migration

  def up
    remove_column :company_mentions, :time_add
  end

  def down
    add_column :company_mentions, :time_add, :integer
  end
end
