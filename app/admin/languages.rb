ActiveAdmin.register BxBlockLandingpage3::Language,  as: "Languages" do
  menu label: "Languages"
  permit_params :language_name, :logo
  before_action :only => :index do @skip_sidebar = true end
  IMAGE = 'No Language logo'.freeze

  form do |f|
    f.inputs do
      f.input :language_name, as: :select
      f.input :logo, as: :file, label: "Logo", hint: f.object.logo.present? ? image_tag(f.object.logo, size: "50x50" ) : IMAGE
    end
    f.actions
  end

  index  title: 'Language' do
    selectable_column
    id_column
    column :language_name
    column :logo do |object|
      object.logo.present? ? image_tag(object.logo, size: "50x50") : IMAGE
    end 

    actions
  end

  show do
    attributes_table do
      row :language_name
      row :logo do |object|
        object.logo.present? ? image_tag(object.logo, size: "50x50" ) : IMAGE
      end
      
    end
  end
end
