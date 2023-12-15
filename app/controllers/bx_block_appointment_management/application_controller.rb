module BxBlockAppointmentManagement
  class ApplicationController < BuilderBase::ApplicationController
    # include BuilderJsonWebToken::JsonWebTokenValidation
    skip_before_action :verify_authenticity_token
    # before_action :validate_json_web_token

    # rescue_from ActiveRecord::RecordNotFound, :with => :not_found

    # private

    # def not_found
    #   render :json => {'errors' => ['Record not found']}, :status => :not_found
    # end
  end
end
