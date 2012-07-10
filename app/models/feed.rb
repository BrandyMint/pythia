# coding: utf-8
class Feed < ActiveRecord::Base

  attr_accessible :name, :url

  has_many :articles
  belongs_to :source

  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true, :uniqueness => true, :url => true

  def collect_artricles
    raise "not implemented"
  end

end