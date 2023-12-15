require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe Admin::SubscriptionPlansController, type: :controller do
  render_views
  let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
 
  before(:each) do
    sign_in admin
    @subs = BxBlockCustomUserSubs::SubscriptionPlan.create(name: "test", price_per_month: "20", description: "testing")
  end

  describe 'Admin::SubscriptionPlansController' do
    let!(:subscription_plan) { create(:subscription_plan) } 
    
    describe "create subscription plan" do
      it "will create subscription plan" do
        post :create, params: { name: "test", price_per_month: "20", description: "testing"}
        expect(response).to have_http_status(200)
      end
    end

    describe "get to index" do
      it "get request" do
        get :index, params: { id:  @subs.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "show" do
      it "show request" do
        get :show,  params: {id:  @subs.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "destroy " do
      it "delete request" do
        delete :destroy, params: { id: @subs.id }
        expect(response).to have_http_status(302)
      end
    end
  end

end