class AddInviteToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :invite, :boolean, default: false
  end
end
