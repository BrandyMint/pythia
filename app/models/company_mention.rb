class CompanyMention < ActiveRecord::Base  

  attr_accessible :article_id, :company_id

  belongs_to :company
  belongs_to :article

  validates :company, :presence => true
  validates :article, :presence => true

  scope :by_company, lambda { |company| where :company_id=>company.id }
  scope :by_article, lambda { |article| where :article_id=>article.id }
  scope :get_article, select('count(*)').group('article_id')

  def self.count_article
    self.get_article.all.count 
  end

  def to_s
    (Article.find self.article_id).title
  end

  def self.get_count_articles_by_range range
    start_day = set_day range[:start_day]
    stop_day = set_day range[:stop_day]
    if start_day > stop_day
      start_day, stop_day = [stop_day, start_day]
    end
    
    result = {}
    days = [start_day, stop_day]
    days.each do |day|
      count_article = Article.get_mention_by_day day
      result[day] = count_article
    end
    result
  end

private

  def self.set_day day
    now_date = Date.today
    if day > now_date
      day = now_date
    end
    day
  end

end
