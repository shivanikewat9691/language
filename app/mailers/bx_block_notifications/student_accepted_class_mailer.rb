module BxBlockNotifications
  class StudentAcceptedClassMailer < ApplicationMailer
      def student_accepted_class(student, class_date,class_time)
      @student = student
      @class_date = class_date
      @class_time = class_time
      attachments.inline["lingoamojr.png"] = File.read("#{Rails.root}/app/assets/images/lingoamojr.png")
      mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Your Class is Accepted') do |format|
        format.html { render 'student_accepted_class' }
      end
    end
  end
end