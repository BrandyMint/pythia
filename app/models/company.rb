# coding: utf-8
class Company < ActiveRecord::Base
# TODO использовать оригинальную базу

  has_many :company_mentions
  has_many :company_synonyms
  has_many :articles, :through => :company_mentions

  def self.data_for_graph_company_mention_last_week
    # пример данных  - переписать
    # articles_last_week = Article.where('date_created > ?', 1.week.ago)
    # date = 1.week.ago
    # articles_last_week.each do |article|
    #   data[date] = article.get_count_mention_for date
    #   date += 1.day
    # end
    data = {
            '11.01' => 4,
            '12.01' => 5,
            '13.01' => 15,
            '14.01' => 25,
            '15.01' => 55
          }
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
    self.articles
      .select("date(created_at) as date_created, count(articles.id) as count_articles")
      .group("date_created").all.count    
  end

  def count_mention_articles
    company_mentions.select('count(company_id)').where('company_id = ?', self.id).group('article_id')
  end

  def count_publication
    company_mentions.select("count(*)").where('company_id = ?', self.id).group('article_id').all.count
  end

end