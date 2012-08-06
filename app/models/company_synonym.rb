class CompanySynonym < ActiveRecord::Base
  validates :company_id, :presence => true
  validates :synonym, :presence => true

  belongs_to :company
end
