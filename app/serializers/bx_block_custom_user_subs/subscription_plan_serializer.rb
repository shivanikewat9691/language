module BxBlockCustomUserSubs
  class SubscriptionPlanSerializer < BuilderBase::BaseSerializer
    attributes *[
        :name,
        :price_per_month,
        :description,
        :language,
        :study_format,
        :language_type,
        :isPopular,
        :isCurrent
    ]

    attributes :susbcription_plan_features do |object|
      BxBlockCustomUserSubs::Feature.all.where(subscription_plan_id: object.id)
    end

    attributes :image_link do |obj,params|
      params[:base_url]+Rails.application.routes.url_helpers.rails_blob_url(obj.logo, only_path: true) if obj.logo.present?
    end
  end
end
