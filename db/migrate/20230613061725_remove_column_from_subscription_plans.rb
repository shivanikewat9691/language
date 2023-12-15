class RemoveColumnFromSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
  	remove_column :subscription_plans, :study_format
  	remove_column :subscription_plans, :language_type
  end
end
