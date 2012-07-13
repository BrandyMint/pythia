class CreateCompanySynonyms < ActiveRecord::Migration
  def change
    create_table :company_synonyms do |t|
      t.references :company_id
      t.string :synonym

      t.timestamps
    end
  end
end
