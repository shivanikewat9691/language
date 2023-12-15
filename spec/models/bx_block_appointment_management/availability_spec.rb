require 'rails_helper'

RSpec.describe BxBlockAppointmentManagement::Availability, type: :model do

  before(:all) do
    @teacher = create(:teacher)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@teacher.id)
    # @availability = create(:availability) params: {availability_params}
  end
   
   let(:availability_params) {{ start_time: "09:00", end_time: "17:00", availability_date: "01/08/2023" } }
  
    it "is valid with valid attributes" do
      @availability = BxBlockAppointmentManagement::Availability.new(
      availability_params.merge(service_provider_id: @teacher.id)  )
      expect(@availability).to be_valid
    end
  
   
    it "is not valid without a service provider id" do 
      @availability = BxBlockAppointmentManagement::Availability.new(
      availability_params.merge(service_provider_id: 9)  )
      expect(@availability).to_not be_valid
    end

    it "shows available slots as nil" do 
      @availability = BxBlockAppointmentManagement::Availability.new(
      availability_params.merge(service_provider_id: @teacher.id)  )
      expect( @availability.send(:get_booked_slots, '01/06/2023' )).to eq([])
    end

    it "shows available slots" do 
      @availability = BxBlockAppointmentManagement::Availability.new(
      availability_params.merge(service_provider_id: @teacher.id)  )
      expect( @availability.send(:slots_list )).to be_an_instance_of(Array)
    end
end

