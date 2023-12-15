ActiveAdmin.register AccountBlock::Student do
  menu label: "Students"
  permit_params :first_name, :last_name, :email, :company, :password, :city, :country, :bio, :personal_intrest, :display_language, :language_option, :language_level, :uniq_id,:image, :time_zone
    IMAGE = 'No picture founded'.freeze


  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :company
      f.input :city
      f.input :country, as: :string
      f.input :bio
      f.input :personal_intrest
      f.input :language_option
      f.input :language_level
      f.input :display_language
      f.input :time_zone
      f.input :image, as: :file, label: "image", hint: f.object.image.present? ? image_tag(f.object.image, size: "50x50" ) : IMAGE
    end
    f.actions
  end

  index  title: 'Students' do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :full_name
    column :email
    column :uniq_id
    column :city
    column :country
     column :image do |object|
      object.image.present? ? image_tag(object.image, size: "50x50") : IMAGE
    end 
   actions do |student|
      if student.activated == false
        item "Account Activation ", account_activation_admin_account_block_student_path(student),
        class: "member_link"
      else
        item "Account Deactivation", account_deactivation_admin_account_block_student_path(student),
        class: "member_link"
      end
    end
  end


  member_action :account_activation, :method => :get do
  end
  member_action :account_deactivation, :method => :get do
  end

  controller do
    def index
      super do |format|
        format.json {
          @account_block_students = @account_block_students.map do |student|
            student.as_json.merge(full_name: student.full_name)
          end
          render json: @account_block_students, status: :ok
        }
      end
    end

    def account_activation
      student = AccountBlock::Student.find(params[:id])
      student.update(activated: true)
      redirect_to  admin_account_block_students_path, notice: 'Account  activated successfully'
    end

    def account_deactivation
      student = AccountBlock::Student.find(params[:id])
      student.update(activated: false)
      redirect_to admin_account_block_students_path, notice: 'Account  deactivated successfully'
    end
  end


 filter :first_name
 filter :last_name
 filter :email
 filter :uniq_id

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :password
      row :company
      row :uniq_id
      row :city
      row :country
      row :bio
      row :personal_intrest
      row :language_option
      row :language_level
      row :display_language
      row :image do |object|
        object.image.present? ? image_tag(object.image, size: "50x50" ) : IMAGE
      end
    end
  end
end

