class RemoveResetPasswordTokenAndResetPasswordSentAtFromTeacher < ActiveRecord::Migration[6.0]
  def change
  	remove_column :teachers, :reset_password_token
    remove_column :teachers, :reset_password_sent_at
  end
end
