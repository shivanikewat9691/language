ActiveAdmin.register AccountBlock::InviteeTeacher do
  menu label: "Invitee_Teachers"
  permit_params :first_name, :last_name, :email
  IMAGE = 'No Teachers profile picture'.freeze

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end

  index  title: 'Invitee_Teachers' do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email

    actions do |invitee_teacher|
      if invitee_teacher.activated == false
        item "Activate and Send Email ", account_activation_admin_account_block_invitee_teacher_path(invitee_teacher),
        class: "member_link"
      else
        item "Email already sent", account_deactivation_admin_account_block_invitee_teacher_path(invitee_teacher),
        class: "member_link"
      end
    end
  end

  filter :first_name
  filter :last_name
  filter :email

  member_action :account_activation, :method => :get do
  end
  member_action :account_deactivation, :method => :get do
  end

  controller do
    def account_activation
      invitee_teacher = AccountBlock::InviteeTeacher.find(params[:id])
      invitee_teacher.update(activated: true)
    
      client_url=request.base_url
      AccountBlock::AdminInviteTeacherMailer.admin_invite_teacher(invitee_teacher, request.base_url, client_url).deliver_now!
      redirect_to  admin_account_block_invitee_teachers_path, notice: 'Account  activated successfully'
    end

    def account_deactivation
      invitee_teacher = AccountBlock::InviteeTeacher.find(params[:id])
      invitee_teacher.update(activated: false)
      redirect_to admin_account_block_invitee_teachers_path, notice: 'Account  deactivated successfully'
    end
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
    end
  end
end

