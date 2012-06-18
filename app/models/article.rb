# coding: utf-8

class Article < ActiveRecord::Base
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  attr_accessible :title, :text, :url
  belongs_to :feed#, :counter_cache => true


  def search_company
    Company.find_each do |company|
      update_mentions_company company if find_company_in_article company
    end
  end

  def delete_if_this_dublicate
    Article.find_each do |article|
      self.delete if article.title == self.title and (article.id != self.id)
    end
  end


private


  def find_company_in_article company
    text.index(company.name) or title.index(company.name)
  end


  def update_mentions_company company
    record_of_company = CompanyMention.find_by_company_id(company.id)
    unless record_of_company
      CompanyMention.create(:company_id => company.id, :mention_count => 1)
    else
      record_of_company.update_attributes(:mention_count => record_of_company.mention_count + 1)
    end
  end

end
