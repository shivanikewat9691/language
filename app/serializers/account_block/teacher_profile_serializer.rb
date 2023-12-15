module AccountBlock
  class TeacherProfileSerializer
    include FastJsonapi::ObjectSerializer
    #set_type :teacher

    attributes *[
      :first_name,
      :last_name,
      :city,
      :country,
      :language_taught,
      :teaching_style,
      :personal_intrest,
      :time_zone,
      :bio,
      :image_link
    ]
    
    attribute :image_link do |object|
      object.image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.image) : nil
    end

    attribute :upcoming_classes do |object, params|
      student_id = params[:current_user].id
      group_classes = object.language_classes.upcoming.not_booked_by_student(student_id).order(class_time: :asc)
      BxBlockClasses::UpcomingClassSerializer.new(group_classes).serializable_hash
    end
  end
end
