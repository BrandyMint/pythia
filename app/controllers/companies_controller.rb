class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
    @count_all_article = Article.all.count
    @graphic_data = Company.data_for_graph_company_mention_last_week
  end
  
  def show
    @company = Company.find params[:id]
    @count_publication = @company.count_publication
    @when_and_count_mention= @company.when_and_count_mention
  end

end