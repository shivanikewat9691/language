require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe Admin::StudyFormatsController, type: :controller do
  render_views
  let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
  before(:each) do
    sign_in admin
    @image =  fixture_file_upload('ic_oneToOne.png')
    @study_format =  BxBlockCustomUserSubs::StudyFormat.create(name: "1-on-1", logo: @image)
  end

    describe "create study format" do
      it "will create study format" do
        post :create, params: { study_format: @study_format}
        expect(response).to have_http_status(200)
      end
    end

    describe "show study format" do
      it "will show list of study format" do
        get :index, params: { id:  @study_format.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "show study format" do
      it "will show study format" do
        get :show,  params: {id:  @study_format.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "destroy " do
      it "will delete study format" do
        delete :destroy, params: { id: @study_format.id }
        expect(response).to have_http_status(302)
      end
    end
end