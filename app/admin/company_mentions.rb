ActiveAdmin.register CompanyMention do

  index do
    column "Company" do |company_mention|
      link_to company_mention.company, admin_company_path(company_mention.company)
    end  

    column "Article" do |company_mention|
      link_to company_mention.article, admin_article_path(company_mention.article)
    end
  end

  # index do
  #   column :company, :sortable => :company_id do
  #     link_to company_mentions.company, admin_company_path(company_mentions.company)
  #   end
  #   column :article, :sortable => :article_id do
  #     link_to company_mentions.article, admin_article_path(company_mentions.article)
  #   end

  #   default_actions
  # end

end
