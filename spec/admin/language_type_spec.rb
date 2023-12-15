require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe Admin::LanguageTypesController, type: :controller do
  render_views
  let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
  before(:each) do
    sign_in admin
    @image =  fixture_file_upload('ic_everyday.png')
    @language_type =  BxBlockCustomUserSubs::LanguageType.create(name: "Everyday", logo: @image)
  end

    describe "create language type" do
      it "will create language type" do
        post :create, params: { language_type: @language_type}
        expect(response).to have_http_status(200)
      end
    end

    describe "show language type" do
      it "will show list of language type" do
        get :index, params: { id:  @language_type.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "show language type" do
      it "will show language type" do
        get :show,  params: {id:  @language_type.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "destroy " do
      it "will delete language type" do
        delete :destroy, params: { id: @language_type.id }
        expect(response).to have_http_status(302)
      end
    end
end