class RenameColumnNameInSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    rename_column :subscription_plans, :price_and_month, :price_per_month
  end
end
