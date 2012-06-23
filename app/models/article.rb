# coding: utf-8

class Article < ActiveRecord::Base
  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  attr_accessible :title, :text, :url
  belongs_to :feed#, :counter_cache => true
  has_many :companyMentions#, :counter_cache => true


  def search_company
    Company.find_each do |company|
      add_mention_company company if find_company_in_article company
    end
  end

  def delete_if_this_dublicate
    Article.find_each do |article|
      self.delete if (article.title == self.title) and (article.id != self.id)
    end
  end


private


  def find_company_in_article company
    text.index(company.name) or title.index(company.name)
  end


  def add_mention_company company
    now_time= Time.now
    self.companyMentions.create(:company_id => company.id, :time_add => now_time)
  end

end
