# coding: utf-8
require 'open-uri'
require 'feedzirra'

class Feed::Rss < Feed

  attr_accessor :state

  before_validation do
    puts "Feed:validate #{url}"
    self.source ||= Source.find_by_name 'manual'
    self.name ||= feed.try :title
  end

  state_machine :initial => :actived do

    before_transition :actived => :collecting, :do => :collect_articles
    after_transition :collecting => :actived, :do => :loop
    #after_transition :collecting => :actived #:do => :collect_articles

    state :actived       # активен - работает - стоит его опрашивать
    state :collecting    # в состоянии сбора
    state :error         # ошибка - временное - не стоит отпрашивать
    state :deactived     # не активен - не стоит его опрашивать
    
    event :collect do
      transition :actived => :collecting 
    end

    event :has_error do
      transition :collecting => :error
    end

    event :disable do
      transition :actived => :deactived
      transition :error => :deactived
    end

    event :enable do
      transition :deactived => :actived
      transition :error => :actived
    end
    # event :active do 
    #   transition :collecting => :actived
    # end

    # event :have_error do
    #   transition :collecting => :deactived
    # end

    # event :make_enable do
    #   transition :deactive => :active
    # end

    # event :make_disable do
    #   transition :active => :deactive
    # end

  end

  def feed
    @feed ||= Feedzirra::Feed.fetch_and_parse(url)
    update_attribute_start @feed
    @feed
  end

  def collect_articles
    # if feed.state == "active"
      begin
        feed.entries.each do |entity|
          articles.create :title => entity.title, :url => entity.url, :text => entity.summary, :guid => entity.id
        end
        self.touch
      rescue Feedzirra::NoParserAvailable => e
        logger.error "ERROR: check #{feed} feed. #{e.message}"
        # self.state = "error"

      rescue ActiveRecord::StatementInvalid => e
        logger.warn "#{e.message}"
      end
    update_attribute_finish
    # end
  end

private
  
  #todo: проверить на работоспособность
  def update_attribute_start feed
    begin
      value = feed.ttl
    rescue NoMethodError => e
      value = nil
    end
    self.collect_started_at = Time.now.to_datetime
    self.ttl = value
    # self.state = "collecting"
    self.save
  end

  def update_attribute_finish
    self.collect_finished_at = Time.now.to_datetime
    self.last_collect_duration = self.collect_finished_at - self.collect_started_at
    # self.state = "active"
    self.save
  end
end