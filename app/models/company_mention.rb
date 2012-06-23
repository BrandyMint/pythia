class CompanyMention < ActiveRecord::Base
  attr_accessible :time_add, :company_id
  
  belongs_to :company#, :counter_cache => true
  belongs_to :article#, :counter_cache => true
  validates :article_id, :presence => true
  validates :time_add, :presence => true
  validates :company_id, :presence => true


  def self.get_company_mention_last_week
  	article_of_last_week = []
  	CompanyMention.find_each do |company_mention_record|
  		if self.in_last_week? company_mention_record.time_add
  			article_of_last_week << company_mention_record.article_id
        # article = Article.find_by_id(company_mention_record.article_id)
  		  # article_of_last_week[article.title] = article.url
  	  end
  	end
    
    article_of_last_week
  end


  def self.get_company_mention_count
    company_mention_count = CompanyMention.select(" company_id, count(article_id) as count_mention").group("company_id")
    result = {}
    company_mention_count.each do |r|
      result[r.company_id] = r.count_mention
    end
    result
  end
  
  
private


  def self.in_last_week? date
    one_day = 60 * 60 * 24
    date >= (Time.now - (one_day * 7))
  end


end