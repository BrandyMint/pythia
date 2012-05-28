class Source < ActiveRecord::Base
  validate :name, :presence => true
  validate :url, :presence => true
  attr_accessible :name, :url, :type
  has_many :feeds
end
