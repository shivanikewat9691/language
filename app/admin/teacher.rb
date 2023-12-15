ActiveAdmin.register AccountBlock::Teacher do
  menu label: "Teachers"
  permit_params :first_name, :last_name, :email, :password, :date_of_birth, :country, :language_taught, :teaching_style, :personal_intrest, :background_of_industries, :time_zone, :city,:image
  IMAGE = 'No picture founded'.freeze

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :date_of_birth, as: :datepicker
      f.input :city
      f.input :country, :as => :string  
      f.input :language_taught
      f.input :teaching_style
      f.input :personal_intrest
      f.input :background_of_industries
      f.input :time_zone
      f.input :image, as: :file, label: "image", hint: f.object.image.present? ? image_tag(f.object.image, size: "50x50" ) : IMAGE
    end
    f.actions
  end

  index  title: 'Teachers' do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :city
    column :country, :as => :string
    column :uniq_id
    column :image do |object|
      object.image.present? ? image_tag(object.image, size: "50x50") : IMAGE
    end 
    actions do |teacher|
      if teacher.activated == false
        item "Account Activation ", account_activation_admin_account_block_teacher_path(teacher),
        class: "member_link"
      else
        item "Account Deactivation", account_deactivation_admin_account_block_teacher_path(teacher),
        class: "member_link"
      end
    end
  end

 filter :first_name
 filter :last_name
 filter :email
 filter :uniq_id

    member_action :account_activation, :method => :get do
    end
    member_action :account_deactivation, :method => :get do
    end

    controller do
      def account_activation
        teacher = AccountBlock::Teacher.find(params[:id])
        teacher.update(activated: true)
        redirect_to  admin_account_block_teachers_path, notice: 'Account  activated successfully'
      end

      def account_deactivation
        teacher = AccountBlock::Teacher.find(params[:id])
        teacher.update(activated: false)
        redirect_to admin_account_block_teachers_path, notice: 'Account  deactivated successfully'
      end
    end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :password
      row :city
      row :country, :as => :string
      row :language_taught
      row :teaching_style
      row :personal_intrest
      row :background_of_industries
      row :time_zone
      row :uniq_id
      row :image do |object|
        object.image.present? ? image_tag(object.image, size: "50x50" ) : IMAGE
      end
    end
  end
end

