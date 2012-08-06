# coding: utf-8
class Article < ActiveRecord::Base

  attr_accessible :title, :text, :url, :original_id

  belongs_to :original, :class_name => 'Article', :counter_cache => :duplicates_count
  belongs_to :feed, :counter_cache => true

  has_many :company_mentions
  has_many :companies, :through => :company_mentions
  has_many :duplicates, :foreign_key => :original_id, :class_name => 'Article'

  scope :last_days, lambda { |days| where('created_at >= current_date - ?', days) }
  scope :last_week, last_days(7)

  validates :text, :presence => true
  validates :url, :presence => true, :url => true

  before_create do
    self.original = Article.find_original self
  end

  after_create :search_and_create_companies_mentions

  class << self
    def count_company_mentions
      CompanyMention.select('count(*)').group('article_id').all.count
    end

    def reload_company_mention
      CompanyMention.delete_all
      articles = Article.all
      articles.each do |article|
        article.search_and_create_companies_mentions
      end
    end

    # Ищет в базе оригинальную статью по примеру
    def find_original sample
      Article.find_each do |article|
        # TODO улучшить механизм поиска оригинала
        return article if article.title == sample.title and article.text == sample.text
      end
      nil
    end
  end

  def search_and_create_companies_mentions
    words.each do |word|
      company = Company.search_by_word word
      company_mentions.create :company_id => company.id if company
    end
  end

  def words
   text_article= self.title + " " + self.text
   @words ||= text_article.split(/\b/).select{ |word| word.size > 2 } 
  end

  def get_mentions_by_company company
    company_mentions.by_company company
  end

  def to_s
    title
  end
end
