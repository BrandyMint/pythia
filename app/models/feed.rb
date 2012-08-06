# coding: utf-8
class Feed < ActiveRecord::Base

  attr_accessible :name, :url, :source_id, :type

  has_many :articles
  belongs_to :source

  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true, :uniqueness => true, :url => true
  validates :source, :presence => true

  def collect_articles
    logger.error "FEED not emplementation method 'collect_articles'. \
        Possibility 'feed' field 'type' is erroneous."
    raise "not implemented"
  end

  def to_s
    self.name
  end
end
