# coding: utf-8

class Article < ActiveRecord::Base
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  attr_accessible :title, :text, :url
  belongs_to :feed, :counter_cache => true

  def search_company
     Company.find_each do |company|
        update_mentions_company company if text.index(company.name)
     end
  end

private

  def update_mentions_company company
    record_of_company = CompanyMention.find_by_company_id(company.id)
    CompanyMention.create(:company_id => company.id, :mention_count => 1) if record_of_company
    record_of_company.increment(:mention_count)
  end

end
