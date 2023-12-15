ActiveAdmin.register BxBlockCustomUserSubs::SubscriptionPlan,  as: "SubscriptionPlan" do
  menu label: "Subscription Plan"
  permit_params :name, :price_per_month, :description, :language, :logo, :study_format, :language_type, :isPopular, :isCurrent, features_attributes:[:id, :description,  :subscription_plan_id, :_destroy ]
  before_action :only => :index do @skip_sidebar = true end
  IMAGE = 'No Language logo'.freeze

  form do |f|
    f.inputs do
      f.input :name
      f.input :price_per_month
      f.input :description
      f.input :language, as: :select
      f.input :logo, as: :file, label: "Logo", hint: f.object.logo.present? ? image_tag(f.object.logo, size: "50x50" ) : IMAGE
      f.input :study_format, as: :select
      f.input :language_type, as: :select
      f.input :isPopular
      f.input :isCurrent
      f.has_many :features, allow_destroy: true do |p|
          p.input :description
      end 
    end
    f.actions
  end

  index  title: 'Subscriptions Plan' do
    selectable_column
    id_column
    column :name
    column :price_per_month do |price|
      "$#{price.price_per_month}/month"
    end
    column :description
    column :language
    column :logo do |object|
      object.logo.present? ? image_tag(object.logo, size: "50x50") : IMAGE
    end 
    column :study_format
    column :language_type
    column :isPopular
    column :isCurrent
    
    actions
  end


  show do
    attributes_table do
      row :name
      row :price_per_month do |price|
        "$#{price.price_per_month}/month"
      end
      row :description
      row :language
      row :logo do |object|
        object.logo.present? ? image_tag(object.logo, size: "50x50" ) : IMAGE
      end
      row :study_format
      row :language_type
      row :isPopular
      row :isCurrent
      tabs do 
        tab  "features" do 
          table_for subscription_plan.features do
            count = 0  
            column "features" do |ff|
              "#{count= count +1} #{ff.description}" 
            end  
          end 
        end
      end  
    end
  end
end
