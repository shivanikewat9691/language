# frozen_string_literal: true
require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin::AccountBlockStudentsController, type: :controller do
  routes { Rails.application.routes }

  before(:each) do
    @password = Faker::Internet.password
    @admin = AdminUser.find_or_create_by(email: Faker::Internet.email)
    @admin.password = @password
    @admin.save
    sign_in @admin
    @student = FactoryBot.create(:student)
  end

  describe 'GET#index' do
    it 'fetch students list' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET#show' do
    it 'show  student detail' do
      get :show, params: { id: @student.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'Get#new' do
    it 'new student' do
      get :new
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
    it "edit student" do
      put :edit, params: {id: @student.id}
      expect(response).to have_http_status(200)
    end
  end
end
