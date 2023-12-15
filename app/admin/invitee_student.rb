ActiveAdmin.register AccountBlock::InviteeStudent do
  menu label: "Invitee_Students"
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

  index  title: 'Invitee_Students' do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email

    actions do |invitee_student|
      if invitee_student.activated == false
        item "Activate and Send Email ", account_activation_admin_account_block_invitee_student_path(invitee_student),
        class: "member_link"
      else
        item "Email already sent", account_deactivation_admin_account_block_invitee_student_path(invitee_student),
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
      invitee_student = AccountBlock::InviteeStudent.find(params[:id])
      invitee_student.update(activated: true)

      client_url=request.base_url
      AccountBlock::AdminInviteStudentMailer.admin_invite_student(invitee_student, request.base_url, client_url).deliver_now!
      redirect_to  admin_account_block_invitee_students_path, notice: 'Account  activated successfully'
    end

    def account_deactivation
      invitee_student = AccountBlock::InviteeStudent.find(params[:id])
      invitee_student.update(activated: false)
      redirect_to admin_account_block_invitee_students_path, notice: 'Account  deactivated successfully'
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
