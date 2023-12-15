module BxBlockCustomUserSubs
  class LanguageTypeController < ApplicationController
    def index
      language_type = BxBlockCustomUserSubs::LanguageType.all.order(:id)
      if language_type.present?
        render json: BxBlockCustomUserSubs::LanguageTypeSerializer.new(language_type, params: {base_url: request.base_url}).serializable_hash
      else
        return render json: {errors: [ {message: 'No language type found'},]}, status: :unprocessable_entity
      end
    end
  end
end