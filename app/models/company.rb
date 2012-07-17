# coding: utf-8
class Company < ActiveRecord::Base
# TODO использовать оригинальную базу

=begin
 Соответвенно у Artilcle должет быть метод get_mentions_by_company(company) 
 который выдает scope для всех упоминаний компании в статье. 

 А вызвав get_mentions_by_company(company).count 
 можно узнать их количество. 

 Тоже самое и для Company - get_mentions_by_article(article)
=end

  has_many :company_mentions
  has_many :company_synonyms
  has_many :articles, :through => :company_mentions

  # def get_mentions_by_company
  #   CompanyMention.get_mentions_by_company company
  # end

  def self.search_by_word_by_word word
    companies = Company.all
    companies.each do |company|
      return company if word == company #word.index company
    end
    false
  end

  def self.update_companies
    companies = load_companies_from_icf_db
    update_info_about_companies companies
  end

  def get_company_mention_count
    get_mentions_by_article.count
  end

  def get_count_article_in_time
    self.articles.select("date(created_at) as date_created, count(articles.id) as count_articles").group("date_created").all
  end

private

  def self.load_companies_from_icf_db
    import_companies = CompanyIcf.all
  end

  def self.update_info_about_companies companies
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
end