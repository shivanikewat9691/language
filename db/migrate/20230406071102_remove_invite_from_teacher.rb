class RemoveInviteFromTeacher < ActiveRecord::Migration[6.0]
  def change
  	 remove_column :teachers, :invite
  end
end
