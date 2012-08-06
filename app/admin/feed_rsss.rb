# coding: utf-8
ActiveAdmin.register Feed::Rss do
  menu :label => 'rss-ки'

  member_action :collect do
    feed = Feed.find params[:id]
    feed.collect_articles

    redirect_to( {:action => :show}, {:notice => "Collected!"} )
  end

  #action_item :only => :show do
  action_item :only => :show do
    link_to 'Собрать статьи', collect_admin_feed_rss_path(feed_rss)
  end

  form do |f|
    f.inputs do
      f.input :url
    end

    f.buttons
  end
end
