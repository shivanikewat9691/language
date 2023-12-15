module AccountBlock
  class LanguageCourseSerializer
    include FastJsonapi::ObjectSerializer

    attributes *[
    :language,
    :language_course_title,
    :category,
    :course_duration,
    :language_type,
    :language_level,
    :country,
    :study_format,
    :language_course_topic,
    :language_course_class_frequency,
    :language_course_study_format,
    :language_course_medium,
    :language_course_type,
    :language_course_level,
    :language_course_start_date,
    :language_course_slots,
    :language_course_total_classes,
    :language_course_status,
    :language_course_occurs_on,
    ]
  end
end
