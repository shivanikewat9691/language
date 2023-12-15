require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe Admin::FrequentlyAskedQuestionsController, type: :controller do
  render_views
  let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
  before(:each) do
    sign_in admin
    @faq =  BxBlockLandingpage3::FrequentlyAskedQuestion.create(title: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!",description: "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos")
  end

  describe 'Admin::FrequentlyAskedQuestionsController' do

    describe "create frequently asked questions" do
      it "will create frequently asked questions" do
        post :create,  params: {faq: @faq}
        expect(response).to have_http_status(200)
      end
    end
    describe "show frequently asked questions" do
      it "will show list of frequently asked questions" do
        get :index, params: {id:  @faq.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "show frequently asked questions" do
      it "will show frequently asked questions" do
        get :show,  params: {id:  @faq.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "destroy " do
      it "will delete language" do
        delete :destroy, params: {id: @faq.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end
