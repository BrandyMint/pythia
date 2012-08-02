class Source < ActiveRecord::Base
  
  attr_accessible :name, :url, :type
  
  has_many :feeds
  
  validate :name, :presence => true, :uniqueness => true
  
  def self.update_feeds
      sources = Source.all
      start_update sources
  end

private

  def self.start_update sources
    sources.each { |source|  source.update_feeds }
  end
end
