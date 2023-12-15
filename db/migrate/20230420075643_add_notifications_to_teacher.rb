class AddNotificationsToTeacher < ActiveRecord::Migration[6.0]
  def change
  	add_column :teachers, :new_cls_request_notifn, :integer, default: 0
    add_column :teachers, :canceled_cls_notifn, :integer, default: 0
    add_column :teachers, :cls_reminder_notifn, :integer, default: 0
    add_column :teachers, :group_cls_notifn, :integer, default: 0
    add_column :teachers, :ending_group_course_notifn, :integer, default: 0
    add_column :teachers, :cls_availability_notifn, :integer, default: 0
  end
end
