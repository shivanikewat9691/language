require 'date'
module BxBlockAppointmentManagement
  class Language121Serializer < BuilderBase::BaseSerializer
    include FastJsonapi::ObjectSerializer
    attributes *[
    :language,
    :study_format,
    :class_date,
    :class_time,
    :student_id,
    :status,
    :student_name
    ]
     attribute :student_name do |object|
        object.student.first_name 
      end
      attribute :study_format do |object|
        object.study_format = "1-on-1"
      end
     attribute :class_time do |object,params|
        time_zone = params[:current_user].time_zone
        object.class_time.in_time_zone(time_zone).strftime("%I:%M %p")
     end
  end
end