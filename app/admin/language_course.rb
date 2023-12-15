ActiveAdmin.register AccountBlock::LanguageCourse do
  menu label: "Language Course"
  
  permit_params :language, :language_course_title, :category, :course_duration, :language_type, :language_level, :language_course_medium, :language_course_start_date, :language_course_class_time, :language_course_slots, :language_course_total_classes, :language_course_status, :language_course_occurs_on, :language_course_description, :language_course_learning_results, :teacher_id, student_ids: []

  form do |f|
    f.inputs do
      f.input :teacher_id, as: :select, collection: AccountBlock::Teacher.all.collect {|t| [t.full_name, t.id]}, include_blank: false, input_html: { class: "slim-select" }
      f.input :student_ids, as: :select, collection: AccountBlock::Student.pluck(:id), input_html: { multiple: true, style: 'width: 250px;' }
      f.input :language
      f.input :language_course_title
      f.input :category
      f.input :course_duration, as: :select
      f.input :language_type, as: :select
      f.input :language_level, as: :select
      f.input :language_course_medium
      f.input :language_course_start_date
      f.input :language_course_class_time
      f.input :language_course_total_classes
      f.input :language_course_occurs_on
      f.input :language_course_description
      f.input :language_course_learning_results
    end
    f.actions
  end

  index  title: 'Language Course' do
    selectable_column
    id_column
    column :teacher_id
    column :student_ids
    column :language
    column :language_course_title
    column :category
    column :course_duration
    # column :language_type
    column :language_level
    column :language_course_start_date
    column :language_course_class_time
    # column :language_course_slots
    # column :language_course_total_classes
    # column :language_course_description
    # column :language_course_learning_results
   actions 
  end
    
  filter :teacher_id
  filter :language
  filter :language_course_title
  filter :language_level
  filter :category

  show do
    attributes_table do
      row :teacher_id
      row :student_ids
      row :language
      row :language_course_title
      row :category
      row :course_duration
      row :language_type
      row :language_level
      row :language_course_start_date
      row :language_course_class_time
      row :language_course_total_classes
      row :language_course_occurs_on
      row :language_course_description
      row :language_course_learning_results
    end
  end

end



