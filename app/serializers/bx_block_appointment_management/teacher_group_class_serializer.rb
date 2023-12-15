module BxBlockAppointmentManagement
	class TeacherGroupClassSerializer < BuilderBase::BaseSerializer

		attributes *[
			:language,
			:study_format,
			:class_title,
			:class_date,
			:class_time,
			:student_count,
      :status,
			:student_list
		]
    attribute :language do |object|
      object.language.gsub("_", " ")
    end
    attribute :class_title do |object|
      object.class_title.split(":")[1]
    end
		attribute :class_time do |object,params|
      time_zone = params[:current_user].time_zone
      object.class_time.in_time_zone(time_zone).strftime("%I:%M %p")
    end
    
    attribute :study_format do |object|
       object.study_format = "Group class"
    end
    attribute :student_count do |object|
      object.students.count
    end
    attribute :student_list do |object|
      array_of_hashes =[]
      object.students.each do |a|
        s={
          "student_id": a.id,
          "student_name": a.first_name,
          "profile_image": a.image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(
            a.image
          ) : nil
        }
        array_of_hashes.push(s)
      end
      array_of_hashes
    end
  end
end
