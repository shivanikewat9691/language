class AddNotificationsToStudent < ActiveRecord::Migration[6.0]
  def change
  	add_column :students, :membership_notifn, :integer, default: 0
    add_column :students, :booked_cls_notfn, :integer, default: 0
    add_column :students, :canceled_cls_notifn, :integer, default: 0
    add_column :students, :cls_reminder_notifn, :integer, default: 0
    add_column :students, :cls_change_notifn, :integer, default: 0
  end
end