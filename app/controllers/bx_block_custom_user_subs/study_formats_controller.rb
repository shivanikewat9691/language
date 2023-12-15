module BxBlockCustomUserSubs
  class StudyFormatsController < ApplicationController
    def index
      study_format = BxBlockCustomUserSubs::StudyFormat.all.order(:id)
      if study_format.present?
        render json: BxBlockCustomUserSubs::StudyFormatSerializer.new(study_format, params: {base_url: request.base_url}).serializable_hash
      else
        return render json: {errors: [ {message: 'No study formats found'},]}, status: :unprocessable_entity
      end
    end
  end
end