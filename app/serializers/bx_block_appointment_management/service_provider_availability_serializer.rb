module BxBlockAppointmentManagement
  class ServiceProviderAvailabilitySerializer < BuilderBase::BaseSerializer
    attributes :id, :availability_date #:start_time, :end_time


    attribute :time_slots do |object| 
      time_slots(object)
    end

    class << self
      private

      def slots_for availability
        availability.slot_lists
      end

      # lists timeslots which is added or update
      def time_slots availability
        availability.timeslots
      end

    end
    
  end
end
