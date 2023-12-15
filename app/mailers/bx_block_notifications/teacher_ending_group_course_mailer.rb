module BxBlockNotifications
  class TeacherEndingGroupCourseMailer < ApplicationMailer
	
      def teacher_ending_group_course_notification(teacher, class_date)
      @teacher = teacher
      @class_date = class_date
         
      mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Ending Group Course') do |format|
        format.html { render 'teacher_ending_group_course_notification' }
      end
    end

  end
end