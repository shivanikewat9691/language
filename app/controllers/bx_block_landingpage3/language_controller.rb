module BxBlockLandingpage3
  class LanguageController < ApplicationController
    def index
      language = BxBlockLandingpage3::Language.all.order(:id)
      if language.present?
        render json: BxBlockLandingpage3::LanguageSerializer.new(language, params: {base_url: request.base_url}).serializable_hash
      else
        return render json: {errors: [ {Languages: 'Not found'},]}, status: :unprocessable_entity
      end
    end
  end
end