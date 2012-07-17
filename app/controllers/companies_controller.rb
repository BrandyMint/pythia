class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
    @all_mention_in_days = Article.company_mentions_count_by_date
    @count_all_mention = CompanyMention.all.count
  end
  
  def show
    @company = Company.find params[:id]
    @article_time = @company.get_count_article_in_time
  end

end