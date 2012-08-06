# coding: utf-8
ActiveAdmin.register Feed do
  index do
    column :source
    column :name
    column :url
    column :articles_count do |feed|
      link_to feed.articles_count, admin_articles_path(:q => {:feed_id_eq => feed.id })
    end

    default_actions
  end
end
