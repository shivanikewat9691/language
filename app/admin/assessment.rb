ActiveAdmin.register AccountBlock::AssessmentQuestion, as: 'Assessment' do

	menu label: "Assessment"
	permit_params :question, :question_no, :answer, :language, assessment_options_attributes:[:id, :assessment_question_no, :answer,  :assessment_question_id, :_destroy ]



	form do |f|
	f.inputs do
	  f.input :question_no
	  f.input :question
	  f.input :answer
	  f.input :language, as: :select
	  f.semantic_errors *f.object.errors.keys
	  f.has_many :assessment_options, allow_destroy: true do |p|
	      p.input :answer, label:"Options - Should give exactly 4 options"
	  end 

	end
	f.actions  

	  
	end

	show do
		attributes_table do
		  row :question_no
		  row :question
		  row :answer
		  row :language
		  row :Options do |object|
		    object.assessment_options.pluck(:answer)
		  end  
		end
	end
end
