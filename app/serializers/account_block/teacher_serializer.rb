module AccountBlock
  class TeacherSerializer
    include FastJsonapi::ObjectSerializer

    attributes *[
      :first_name,
      :last_name,
      :phone_number,
      :email,
      :date_of_birth,
      :city,
      :country,
      :language_taught,
      :teaching_style,
      :personal_intrest,
      :background_of_industries,
      :time_zone,
      :bio,
      :uniq_id,
      :display_language,
      :image_link
    ]
    
    attribute :image_link do |object|
      object.image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.image) : nil
    end
  end
end
