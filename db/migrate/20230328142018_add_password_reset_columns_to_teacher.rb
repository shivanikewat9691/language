class AddPasswordResetColumnsToTeacher < ActiveRecord::Migration[6.0]
  def change
  	add_column :teachers, :reset_password_token, :string
	add_column :teachers, :reset_password_sent_at, :datetime
  end
end
