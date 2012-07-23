# coding: utf-8
class Company < ActiveRecord::Base
# TODO использовать оригинальную базу

  has_many :company_mentions
  has_many :company_synonyms
  has_many :articles, :through => :company_mentions

  def self.data_for_graph_company_mention_last_week
    data = {}
    days_and_counters.each do |day_and_counter|
      day = day_and_counter.created
      count_mentions = day_and_counter.counter
      data[day] = count_mentions
    end
    data
  end

  def self.days_and_counters
    @days_and_counter = CompanyMention
          .select("date(created_at) as created, count(*) as counter")
          .group("date(created_at)")
  end

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
      return company if word == company #word.index company
    end
    false
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

  def dates_and_counters
    @dates_and_counters = self.articles
      .select("date(articles.created_at) as date_created, count(articles.id) as count_articles")
      .group("date_created").all
  end

  def count_mention_articles
    company_mentions.select('count(company_id)').where('company_id = ?', self.id).group('article_id')
  end

  def count_publication
    company_mentions.select("count(*)").where('company_id = ?', self.id).group('article_id').all.count
  end

end