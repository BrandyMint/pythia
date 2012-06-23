# coding: utf-8
class CompanyMentionsController < ApplicationController
  def index
  	@table_mentions = {}
    @article_mentions = {}

    #after add article
    Article.find_each do |article|
      article.search_company
    end

    @table_mentions = CompanyMention.get_company_mention_last_week
  end
end
#     CompanyMention.find_each do |r|
#       company = Company.find(r.company_id)
#       @table_mentions[company.name] = Article.find_by_id(r.article_id).title


      # #for debug!
      # Article.find_each do |article|
      #   if article.title.index(company.name) or article.text.index(company.name)
      #     @article_mentions[company.name] = {article.title => article.url}
      #   end
      # end

# 		end
		
#   end
# end