class ChangeDefaultValueForClassReminderAndClassAvailabilityOnTeachers < ActiveRecord::Migration[6.0]
  def change 
    change_column_default :teachers, :cls_reminder_notifn, from: 0, to: 1 
    change_column_default :teachers, :cls_availability_notifn, from: 0, to: 1 
  end
end
