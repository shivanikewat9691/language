class ChangeColumnColumnNameFromDateTimeToDateInTeachers < ActiveRecord::Migration[6.0]
  def change
  	change_column :teachers, :date_of_birth,  :date
  end
end
