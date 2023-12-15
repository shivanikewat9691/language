class RemoveColumnInSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
  	remove_column :subscription_plans, :language
  end
end
