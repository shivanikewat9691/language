module BxBlockClasses
  class UpcomingClassSerializer
    include FastJsonapi::ObjectSerializer

    attributes :class_plan, :class_title, :class_description

    attribute :class_time do |object, params|
      #time_zone = params[:current_user].time_zone
    	object.class_time.strftime("%a, %b %d %Y, %H:%M")
    end

    attribute :left do |object|
    	object.students_max - object.students.count
    end
  end
end