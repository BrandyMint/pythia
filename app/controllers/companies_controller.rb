class CompaniesController < ApplicationController
  
  def index
		@companies = Company.all
    @count_articles = get_count_articles
  end
  

  def show
    @company = Company.find params[:id]
    @company_data = @company.articles.select("date(created_at) as date_created, count(articles.id) as count_articles").group("date_created").all
  end


private
  

  def get_count_articles
    sql_result = execute_sql_query
    result = generate_result sql_result
  end


  def execute_sql_query
    sql = ActiveRecord::Base.connection
    result = sql.execute("select date(created_at) as date_created, count(articles.id) as count_articles 
        from articles right join company_mentions on company_mentions.article_id = articles.id
        group by date_created")
  end
  

  def generate_result sql_data
    @count_articles = {} #date => count_mention
    sql_data.each do |record|
      date = record["date_created"]
      counter = record["count_articles"]
      @count_articles[date] = counter
  end
    
    @count_articles
  end

end