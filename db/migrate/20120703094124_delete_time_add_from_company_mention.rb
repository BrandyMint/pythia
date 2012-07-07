class DeleteTimeAddFromCompanyMention < ActiveRecord::Migration
  def change
    change_table :company_mentions do |t|
      t.remove :time_add
    end
  end
end
