class AddColumnToSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :subscription_plans, :study_format, :integer, default: 0
  end
end
