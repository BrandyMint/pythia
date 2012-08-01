ActiveAdmin.register Article do
  
  sidebar :help do
    ul do
      li "All Article #{Article.count}"
      li "of whitch #{CompanyMention.count_article} articles"
      # TODO: remove
      li "About company mention: #{CompanyMention.get_count_articles_by_range(start_day: 1.week.ago, stop_day: Date.today)}"
    end
  end
end
