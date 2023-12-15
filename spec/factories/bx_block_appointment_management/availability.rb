FactoryBot.define do
  require 'faker'

  factory :availability, class: 'BxBlockAppointmentManagement::Availability' do
    availability_date { "01/08/2023"    }
    start_time { "09:00"  }
    end_time { "17:00" }
  end
end