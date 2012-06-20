# coding: utf-8
class CompanyMentionsController < ApplicationController
  def index
  	@table_mentions = {}
    @article_mentions = {}

    Article.find_each do |article|
      article.search_company
    end

    CompanyMention.find_each do |record|
      company = Company.find(record.company_id)
      @table_mentions[company.name] = record.mention_count
      #for debug!
      Article.find_each do |article|
        if article.title.index(company.name) or article.text.index(company.name)
          @article_mentions[company.name] = {article.title => article.url}
        end
      end

		end
		
  end
end