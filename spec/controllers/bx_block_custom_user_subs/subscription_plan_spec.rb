require 'rails_helper'

RSpec.describe BxBlockCustomUserSubs::SubscriptionPlan, type: :request do
  
  SUBSCRIPTION_PLAN_URL = '/bx_block_custom_user_subs/subscription_plans'

  let(:sub_plans_params) {{"name": "Test", "price_per_month": "$20/month", "description": "testing"}}

  before do
    @subscription_plan = FactoryBot.create(:subscription_plan)

  end
  describe "show data" do
    it 'will show all subscription plans' do
      get SUBSCRIPTION_PLAN_URL , params: {subscription_plan: @subscription_plan}
      expect(response).to have_http_status :ok
    end
    it 'will show all subscription plans with language' do
      get SUBSCRIPTION_PLAN_URL , params: {language: @subscription_plan.id}
      expect(response).to have_http_status :ok
    end
     it 'will show all subscription plans language_type' do
      get SUBSCRIPTION_PLAN_URL , params: {language_type: @subscription_plan.language_type}
      expect(response).to have_http_status :ok
    end
    it 'will show all subscription plans study_format' do
      get SUBSCRIPTION_PLAN_URL , params: {study_format: @subscription_plan.study_format}
      expect(response).to have_http_status :ok
    end
    it 'will show all subscription plans study_format and language' do
      get SUBSCRIPTION_PLAN_URL , params: {study_format: @subscription_plan.study_format, language: @subscription_plan.language}
      expect(response).to have_http_status :ok
    end

    it 'will show all subscription plans study_format and language language_type' do
      get SUBSCRIPTION_PLAN_URL , params: {study_format: @subscription_plan.study_format, language: @subscription_plan.language, language_type: @subscription_plan.language_type}
      expect(response).to have_http_status :ok
    end

    it 'will not show any subscription plans' do
      BxBlockCustomUserSubs::SubscriptionPlan.destroy_all
      get SUBSCRIPTION_PLAN_URL , params: {subscription_plan: @subscription_plan}
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end