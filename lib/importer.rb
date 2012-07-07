class Importer
  

  def update_articles
    articles = load_articles
    extract_companies articles
  end


  def update_companies
    companies = load_companies_from_icf_db
    update_info_about_companies companies
  end
  

private


  def load_articles
    feeds = load_feeds
    articles = import_articles feeds
  end


  def load_feeds
    feeds = [Feed.last]
  end


  def import_articles feeds
    articles = []
    feeds.each do |feed|
      articles << get_articles(feed)
    end
    articles
  end


  def get_articles feed
    begin
      lenta = SimpleRSS.parse(open(feed.url))
      lenta.items.each do |msg|
        doc = feed.articles.create(:title => msg.title, :url => msg.link, :text => msg.description)
      end
    rescue OpenURI::HTTPError
      puts "feed #{feed.url} not avaible"
    end
  end
  

  def extract_companies articles
    articles.each { |article|  article.first.find_companies }
  end


  def load_companies_from_icf_db
    import_companies = CompanyIcf.all
  end


  def update_info_about_companies companies
    companies.each do |company|
      local_company = Company.where(:id => company.id).first
      unless local_company
        local_company = Company.new
        local_company.id = company.id
      end

      local_company.name = company.name
      local_company.slug = company.slug
      local_company.save
    end

  end
    
end