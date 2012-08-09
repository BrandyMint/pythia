class CompanySynonym < ActiveRecord::Base

  investcafe_db = Settings.investcafe_db
  establish_connection = investcafe_db

  validates :company_id, :presence => true
  validates :synonym, :presence => true

  belongs_to :company
end
