# coding: utf-8
class Company < ActiveRecord::Base
# TODO использовать оригинальную базу

  has_many :company_mentions
  has_many :company_synonyms
  has_many :articles, :through => :company_mentions

  def self.update_companies
    companies = CompanyIcf.all
    companies.each do |company|
      local_company = Company.where(:id => company.id).first
      unless local_company
        local_company = Company.new
        local_company.id = company.id
      end
      local_company.name = company.name
      local_company.slug = company.slug
      local_company.save
    end
  end

  def self.search_by_word word
    companies = Company.all
    companies.each do |company|
      return company if company.name_compare word
    end
    false
  end

  def name_compare word
    # word.to_s.mb_chars.upcase.index self.name.to_s.mb_chars.upcase
    word.to_s.mb_chars.upcase == self.name.to_s.mb_chars.upcase
  end

  def get_mentions_by_article article
    company_mentions.by_article article
  end

  def when_and_count_mention
    data = {}
    dates_and_counters.each do |record|
      day = record.date_created
      counter = record.count_articles
      data[day] = counter
    end
    data
  end

  def count_mention_articles
    company_mentions.select('count(company_id)').where('company_id = ?', self.id).group('article_id')
  end

  def count_publication
    company_mentions.select("count(*)").where('company_id = ?', self.id).group('article_id').all.count
  end

  def to_s
    self.name
  end
end