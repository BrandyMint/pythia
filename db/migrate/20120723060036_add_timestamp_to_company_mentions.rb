class AddTimestampToCompanyMentions < ActiveRecord::Migration
  def up
     change_table :company_mentions do |t|
        t.timestamps
     end
  end

  def down
    change_table :company_mentions do |t|
      remove_column :company_mentions, :created_at
      remove_column :company_mentions, :updated_at
    end
  end
end
