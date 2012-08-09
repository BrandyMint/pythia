# conding: utf-8
class CompaniesController < ApplicationController
  respond_to :html

  def index
    @companies = Company.order(:name).page params[:page]
    respond_with @companies
  end
  
  def show
    @company = Company.find params[:id]
    respond_with @company
  end

end