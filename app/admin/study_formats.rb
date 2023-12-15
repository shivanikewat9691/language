ActiveAdmin.register BxBlockCustomUserSubs::StudyFormat,  as: "Study_format" do
  STUDY = "Study Format"
  menu label: STUDY
  permit_params :name, :logo
  before_action :only => :index do @skip_sidebar = true end
  IMAGE = 'No logo presented'.freeze

  form do |f|
    f.inputs do
      f.input :name, as: :select
      f.input :logo, as: :file, label: "Logo", hint: f.object.logo.present? ? image_tag(f.object.logo, size: "50x50" ) : IMAGE
    end
    f.actions
  end

  index  title: STUDY do
    selectable_column
    id_column
    column :name
    column :logo do |object|
      object.logo.present? ? image_tag(object.logo, size: "50x50") : IMAGE
    end 

    actions
  end

  show do
    attributes_table do
      row :name
      row :logo do |object|
        object.logo.present? ? image_tag(object.logo, size: "50x50" ) : IMAGE
      end
      
    end
  end
end
