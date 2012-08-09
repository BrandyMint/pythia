# coding: utf-8
require 'open-uri'
require 'feedzirra'
class Feed::Rss < Feed

  before_validation do
    puts "Feed:validate #{url}"
    self.source ||= Source.find_by_name 'manual'
    self.name ||= feed.try :title
  end

  def feed
    @feed ||= Feedzirra::Feed.fetch_and_parse(url)
    update_attribute_start @feed
    @feed
  end

  def collect_articles
    if feed.status == "active"
      begin
        feed.entries.each do |entity|
          articles.create :title => entity.title, :url => entity.url, :text => entity.summary, :guid => entity.id
        end
        self.touch
      rescue Feedzirra::NoParserAvailable => e
        logger.error "ERROR: check #{feed} feed. #{e.message}"
        self.status = "error"

      rescue ActiveRecord::StatementInvalid => e
        logger.warn "#{e.message}"
      end
    update_attribute_finish
    end
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
    self.status = "collecting"
  end

  def update_attribute_finish
    self.collect_finished_at = Time.now.to_datetime
    self.interval_time_last_collected = self.collect_finished_at - self.collect_started_at
    self.status = "active"
  end
end