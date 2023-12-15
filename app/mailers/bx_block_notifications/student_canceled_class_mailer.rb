module BxBlockNotifications
  class StudentCanceledClassMailer < ApplicationMailer
      def student_canceled_class(student, class_date,class_time)
      @student = student
      @class_date = class_date
      @class_time = class_time
      attachments.inline["lingoamojr.png"] = File.read("#{Rails.root}/app/assets/images/lingoamojr.png")
      mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Your Class Canceled') do |format|
        format.html { render 'student_canceled_class' }
      end
    end

  end
end