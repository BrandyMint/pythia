class CompanySynonym < ActiveRecord::Base
  establish_connection "icfdedb_test"

  validates :company_id, :presence => true
  validates :synonym, :presence => true

  belongs_to :company
end