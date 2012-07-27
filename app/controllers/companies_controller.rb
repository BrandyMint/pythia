class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
    @count_all_article = Article.all.count
  end
  
  def show
    @company = Company.find params[:id]
  end

end
