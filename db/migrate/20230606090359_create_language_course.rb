class CreateLanguageCourse < ActiveRecord::Migration[6.0]
  def change
    create_table :language_courses do |t|
    	t.string :language_course_title
	    t.string :language_course_topic
			t.string :language_course_class_frequency
			t.string :language_course_study_format
			t.string :language_course_medium
			t.string :language_course_type
			t.string :language_course_level
			t.date :language_course_start_date
			t.time :language_course_class_time
			t.integer :language_course_slots
			t.integer :language_course_total_classes
			t.string :language_course_status
			t.string :language_course_occurs_on
			t.string :language_course_description
			t.text :language_course_learning_results
			t.references :teacher
	    t.timestamps
    end
  end
end
