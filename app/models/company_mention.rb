class CompanyMention < ActiveRecord::Base
  attr_accessible :mention_count, :company_id
  
  # http://stackoverflow.com/questions/2955820/how-to-implement-a-counter-cache-in-rails
  belongs_to :company#, :counter_cache => true
  
  validates :mention_count, :presence => true, :numericality => true
  validates :company_id, :presence => true
end