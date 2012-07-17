class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
    @count_all_article = Article.all.count

    # @count_mention_article = CompanyMention.group('article_id')
    # @all_mention_in_days = Article.company_mentions_count_by_date
    # @all_count_companies_mentions = Company.
    # @all_article = Article.all.count
    # @all_mention_in_days = Article.company_mentions_count_by_date
    # @count_all_mention = CompanyMention.all.count
  end
  
  def show
    @company = Company.find params[:id]
    @count_publication = @company.count_publication
    @when_and_count_mention= @company.when_and_count_mention
    # @article_time = @company.get_count_article_in_time
  end

end