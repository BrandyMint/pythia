# coding: utf-8
class ArticlesController < ApplicationController
  respond_to :html

  def index
    @articles = Article.order(:created_at).page params[:page]

    respond_with @articles
  end

  def show
    @article = Article.find params[:id]
    respond_with @article
  end
end
