module BxBlockCustomUserSubs
  class ApplicationController < BuilderBase::ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found

    private

    def not_found
      render :json => {'errors' => ['Record not found']}, :status => :not_found
    end

    def current_user
      @current_user ||= AccountBlock::Account.find(@token.id) if @token.present?
    end
  end
end
