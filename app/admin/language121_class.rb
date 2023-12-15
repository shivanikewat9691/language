ActiveAdmin.register AccountBlock::Language121Class do
  menu label: "121classes"

permit_params :language, :study_format, :class_level, :class_type, :class_duration, :class_plan, :class_date, :class_time, :class_weeks, :time_zone, :status, :student_id,
  :teacher_id,:cancel_message
  form do |f|
    f.inputs do
      f.input :language
      f.input :study_format
      f.input :class_level
      f.input :class_type
      f.input :class_plan
      f.input :class_date
      f.input :class_time
      f.input :class_duration
      f.input :class_weeks
      f.input :time_zone
      f.input :status
      f.input :student_id
      f.input :teacher_id
    end
    f.actions
  end

  index  title: 'language121_classes' do
    selectable_column
    id_column
    column :language
    column :study_format
    column :class_level
    column :class_type
    column :class_plan
    column :class_date
    column :class_time
    column :class_duration
    column :class_weeks
    column :time_zone
    column :status
    column :cancel_message
 
    actions
  end

 filter :language
 filter :study_format
 filter :class_level
 filter :class_date

end








