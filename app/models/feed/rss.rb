 # coding: utf-8
require 'open-uri'
class Feed::Rss < Feed

  before_validation do
    self.source ||= Source.find_by_name 'manual'
    self.name ||= dom.title
  end

  def dom
    @dom ||= SimpleRSS.parse open(url)
  end

  def collect_articles
    begin
      dom.items.each do |msg|
        articles.create :title => msg[:title],
              :url => msg[:link],
              :text => msg[:description],
              :guid => msg[:guid] #,
              # :perma_link => msg[:guid].isPermaLink="true"
      end

      self.touch
    rescue OpenURI::HTTPError => err
      raise err
    rescue ActiveRecord::StatementInvalid => err
      raise err
    end
  end
end
