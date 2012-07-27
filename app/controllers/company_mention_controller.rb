class CompanyMentionController < ApplicationController
  def index
    @company_mentions = CompanyMention.order(:company_id)
  end

  def show
    @company_mention = CompanyMention.find params[:id]
    @article = Article.find @company_mention.article_id
    @company = Company.find @company_mention.company_id
  end
end
