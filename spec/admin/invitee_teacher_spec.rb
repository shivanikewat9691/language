require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin::AccountBlockInviteeTeachersController, type: :controller do
  routes { Rails.application.routes }

  before(:each) do
    @password = Faker::Internet.password
    @admin = AdminUser.find_or_create_by(email: Faker::Internet.email)
    @admin.password = @password
    @admin.save
    sign_in @admin
    @invitee_teacher = FactoryBot.create(:invitee_teacher)
  end

  describe 'GET#index' do
    it 'fetch invitee_teachers list' do
      get :index
      expect(response.status).to eq(200)
    end
  end

describe 'Get#new' do
    it 'new invitee teacher' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET#show' do
    it 'show  invitee teachers detail' do
      get :show, params: { id: @invitee_teacher.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "Put,edit,delete" do
    let(:params) do {
      first_name:  Faker::Name.first_name, 
      last_name:  Faker::Name.last_name,
      email: Faker::Internet.email }
    end
  end

  describe "edit" do
    it "edit invitee teacher" do
      put :edit, params: {id: @invitee_teacher.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "activate" do
    it "activates invitee teacher" do
      get :account_activation, params: {id: @invitee_teacher.id}
      expect(response).to have_http_status(302)
    end
  end

  describe "deactivate" do
    it "deactivates invitee teacher" do
      get :account_deactivation, params: {id: @invitee_teacher.id}
      expect(response).to have_http_status(302)
    end
  end
end