module BxBlockLandingpage3
  class LanguageSerializer < BuilderBase::BaseSerializer
    attributes :id, :language_name

    attributes :image_link do |obj,params|
      params[:base_url]+Rails.application.routes.url_helpers.rails_blob_url(obj.logo, only_path: true) if obj.logo.present?
    end
  end
end
