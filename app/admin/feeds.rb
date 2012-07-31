# coding: utf-8
ActiveAdmin.register Feed do

  form do |f|
    f.inputs "Feed" do
      f.input :name
      f.input :url
      f.input :type
    end
    f.buttons
  end

end