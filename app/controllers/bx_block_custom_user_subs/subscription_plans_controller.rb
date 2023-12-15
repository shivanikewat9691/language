module BxBlockCustomUserSubs
  class SubscriptionPlansController < ApplicationController

    def index
      @subscription_plan = BxBlockCustomUserSubs::SubscriptionPlan.all
      if @subscription_plan.present?
        if params[:language].present? && params[:study_format].present? && params[:language_type].present?
          @lng = BxBlockCustomUserSubs::SubscriptionPlan.where(language: params[:language], study_format: params[:study_format], language_type: params[:language_type])
          render json: SubscriptionPlanSerializer.new(@lng, params: {base_url: request.base_url}, meta: {
          message: "List of Subscription plans."}).serializable_hash, status: :ok
        elsif params[:study_format].present? && params[:language].present?
          @lng = BxBlockCustomUserSubs::SubscriptionPlan.where(study_format: params[:study_format], language: params[:language])
          render json: SubscriptionPlanSerializer.new(@lng, params: {base_url: request.base_url}, meta: {
          message: "List of Subscription plans."}).serializable_hash, status: :ok
        elsif params[:language].present?
          @lng = BxBlockCustomUserSubs::SubscriptionPlan.where(language: params[:language])
          render json: SubscriptionPlanSerializer.new(@lng, params: {base_url: request.base_url}, meta: {
          message: "List of Subscription plans."}).serializable_hash, status: :ok
        elsif params[:study_format].present?
          @study_format = BxBlockCustomUserSubs::SubscriptionPlan.where(study_format: params[:study_format])
          render json: SubscriptionPlanSerializer.new(@study_format, params: {base_url: request.base_url}, meta: {
          message: "List of Subscription plans."}).serializable_hash, status: :ok
        elsif params[:language_type].present?
          @language_type = BxBlockCustomUserSubs::SubscriptionPlan.where(language_type: params[:language_type])
          render json: SubscriptionPlanSerializer.new(@language_type, params: {base_url: request.base_url}, meta: {
          message: "List of Subscription plans."}).serializable_hash, status: :ok
        else
          render json: SubscriptionPlanSerializer.new(@subscription_plan, params: {base_url: request.base_url}, meta: {
            message: "List of Subscription plans."}).serializable_hash, status: :ok
        end
      else
        render json: {errors: [{message: 'No Subscription plans found.'},]}, status: :unprocessable_entity
      end
    end
  end
end