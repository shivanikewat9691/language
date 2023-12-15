require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe Admin::LanguagesController, type: :controller do
  render_views
  let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
  before(:each) do
    sign_in admin
    @image =  fixture_file_upload('german.png')
    @language =  BxBlockLandingpage3::Language.create(language_name: "English", logo: @image)
  end

    describe "create language" do
      it "will create language" do
        post :create, params: { language: @language}
        expect(response).to have_http_status(200)
      end
    end

    describe "show lanuages" do
      it "will show list of languages" do
        get :index, params: { id:  @language.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "show language" do
      it "will show language" do
        get :show,  params: {id:  @language.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "destroy " do
      it "will delete language" do
        delete :destroy, params: { id: @language.id }
        expect(response).to have_http_status(302)
      end
    end
end