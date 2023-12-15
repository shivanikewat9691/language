ActiveAdmin.register BxBlockClasses::LanguageClass, as: "Group Classes" do
  menu label: "Group Classes"
  permit_params :language, :study_format, :class_level, :class_type, :class_plan, :class_date, :class_time, :language_course_id, :students_min, :students_max, :status, :class_title, :class_description, student_ids: []
 
  form do |f|
    f.inputs do
      f.input :language_course, as: :select, collection: AccountBlock::LanguageCourse.all.collect { |c| [c.language_course_title, c.id]}, include_blank: false
      f.input :class_title
      f.input :language
      f.input :study_format
      f.input :class_level
      f.input :class_type
      f.input :class_plan
      f.input :class_date
      f.input :class_time
      f.input :students_min
      f.input :students_max
      f.input :status
      f.input :student_ids, as: :selected_list, url: '/admin/account_block_students', fields: ['first_name', 'last_name'], display_name: 'full_name'
      f.input :class_description
    end
    f.actions
  end

  index  title: 'classes' do
    selectable_column
    id_column
    column :teacher do |lc|
      link_to lc.teacher.full_name, admin_account_block_teachers_path(lc.teacher.id)
    end
    column :class_title
    column :language
    column :study_format
    column :class_level
    column :class_type
    column :class_date
    column :class_time
    tag_column :status
 
    actions
  end


 filter :language
 filter :study_format
 filter :class_level
 filter :class_date

  show do
    attributes_table do
      row :language
      row :study_format
      row :class_level
      row :class_type
      row :class_plan
      row :class_date
      row :class_time
    end  
  end
end

