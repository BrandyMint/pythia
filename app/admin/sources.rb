# coding: utf-8
ActiveAdmin.register Source do

  form do |f|
    f.inputs "Source" do
      f.input :name 
      f.input :url 
      f.input :type
    end
    f.buttons
  end
end