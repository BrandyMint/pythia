ActiveAdmin.register Article do
  
  sidebar :help do
    ul do
      li "All Article #{Article.count}"
      li "of whitch #{CompanyMention.count_article} articles"
    end
  end
end
