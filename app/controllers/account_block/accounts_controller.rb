module AccountBlock
  class AccountsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation
    before_action :validate_json_web_token, except: :create
    before_action :current_user

    def update
      if @account.update(profile_setup_params.except(:user_type, :email, :user_name))
       render json: AccountSerializer.new(@account, meta: {message: 'Profile Updated Successfully.'
        }).serializable_hash, status: 200
      else
        render json: {errors: format_activerecord_errors(@account.errors), status: 422},
            status: :unprocessable_entity
      end
    end


  private
        
    def current_user
      @account = AccountBlock::Account.find_by(id: @token&.id)
      render json: {errors: [{token: I18n.t('invalid_token')},]}, status: :unprocessable_entity and return unless @account.present?
    end

    def profile_setup_params
      params.permit(:first_name, :last_name, :email, :phone_number, :alternate_phone_number, :user_name, :user_type, :gender, :qualification, :school_name, :spoken_language, :language_in_expert, :image, :learn_language, :knowledge_level, :learner_profile, :role_id)
    end

  end
end
