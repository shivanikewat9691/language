module BxBlockCustomUserSubs
	class Feature < ApplicationRecord
		self.table_name = :features

		validates :description, presence: true
		belongs_to :subscription_plan, class_name: 'BxBlockCustomUserSubs::SubscriptionPlan'
	end
end
