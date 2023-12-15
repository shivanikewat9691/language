module BxBlockCustomUserSubs
  class LanguageTypeSerializer < BuilderBase::BaseSerializer
    attributes :id, :name

    attributes :image_link do |obj,params|
      params[:base_url]+Rails.application.routes.url_helpers.rails_blob_url(obj.logo, only_path: true) if obj.logo.present?
    end
  end
end
