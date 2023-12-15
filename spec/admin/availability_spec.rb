require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe BxBlockAppointmentManagement::AvailabilitiesController, type: :controller do
    render_views
    let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
    before(:each) do
      sign_in admin
    end
before :context do
    @teacher = FactoryBot.create(:teacher)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@teacher.id)
  end  
   
    describe "get to index" do
      it "get request" do
        request.headers.merge!(token:@token)
        get :index
        expect(response.body).to include('List of all slots')
      end
    end

  end
