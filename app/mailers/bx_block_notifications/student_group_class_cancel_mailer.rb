module BxBlockNotifications
    class StudentGroupClassCancelMailer < ApplicationMailer
        def student_canceled_class(student,class_date,class_time, class_title)
        @student = student
        @class_date = class_date
        @class_time = class_time
        @class_title = class_title
        mail(
            to: @student.email,
            from: 'builder.bx_dev@engineer.ai',
            subject: 'Your group lesson was cancelled') do |format|
          format.html { render 'student_group_class_cancel' }
        end
      end
  
    end
  end