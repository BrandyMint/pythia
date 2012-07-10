class Company < ActiveRecord::Base

  has_many :company_mentions
  has_many :articles, :through => :company_mentions

end