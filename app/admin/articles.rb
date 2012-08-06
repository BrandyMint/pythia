ActiveAdmin.register Article do

  index do
    column :feed
    column :title
    column :original
    column :duplicates_count
    column :company_mentions_count do |a|
      a.company_mentions.count
    end
    default_actions
  end

  sidebar :help do
    ul do
      li "All Article #{Article.count}"
      li "of whitch #{CompanyMention.count_article} articles"
    end
  end
end
