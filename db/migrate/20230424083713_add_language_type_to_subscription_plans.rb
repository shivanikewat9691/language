class AddLanguageTypeToSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :subscription_plans, :language_type, :integer, default: 0
  end
end
