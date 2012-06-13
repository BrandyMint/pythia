class CreateCompanyMentions < ActiveRecord::Migration
  def change
    create_table :company_mentions do |t|
      t.integer :company_id
      t.integer :mention_count

      t.timestamps
    end
  end
end
