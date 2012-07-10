# coding: utf-8
require 'open-uri'

class Feed < ActiveRecord::Base

# TODO не верный порядок описания. Сначала идут аттритубы, затем ассоциации, затем валидация

  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true, :uniqueness => true, :url => true
  attr_accessible :name, :url
  belongs_to :source
  has_many :articles

  def self.update_feeds
    sources = Source.all
    start_update sources    
  end

private

  def self.start_update sources
    sources.each { |source|  source.update_feeds }
  end
end
