FactoryBot.define do
  factory :subscription_plan, class: BxBlockCustomUserSubs::SubscriptionPlan do
    name {"test"}
    price_per_month {"20"}
    description {"testing"}
    language {"English"}
    study_format {"Group"}
    language_type {"Everyday"}
  end
end
