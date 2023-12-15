module BxBlockNotifications
  class StudentNotificationsController < ApplicationController

  NO_STUDENT_ERR = 'No student found with this email'
  CLASS_DETAILS_MISSING = 'Class Details Missing'

	def student_membership
     @email = params[:email]
      @student = AccountBlock::Student.find_by(email: @email)
      if @student 
        StudentMembershipMailer.student_membership(@student).deliver_now
          render json: {message: 'Membership email sent'}, status: :ok
        else
       
          render json: { message: NO_STUDENT_ERR}
      end
    end

    def student_booked_class_confirmation
     @email = params[:email]
     @class_date = params[:class_date]
      @student = AccountBlock::Student.find_by(email: @email)
      if @student 
        if @class_date 
        StudentBookedClassConfirmationMailer.student_booked_class_confirmation(@student, @class_date).deliver_now!
          render json: {message: 'Booked Class email sent'}, status: :ok
        else
          render json: { message: CLASS_DETAILS_MISSING}
        end
      else
          render json: { message: NO_STUDENT_ERR}
      end
    end

def student_canceled_class
      @email = params[:email]
      @class_date = params[:class_date]
      @student = AccountBlock::Student.find_by(email: @email)
      if @student 
        if @class_date 
        StudentCanceledClassMailer.student_canceled_class(@student, @class_date).deliver_now!
          render json: {message: 'Canceled Class email sent'}, status: :ok
        else
          render json: { message: 'Canceled Class details missing'}
        end
      else
          render json: { message: NO_STUDENT_ERR}
      end
    end

    def student_class_reminder
    	@email = params[:email]
     	@class_date = params[:class_date]
      @student = AccountBlock::Student.find_by(email: @email)
      if @student 
        if @class_date 
        StudentClassReminderMailer.student_class_reminder(@student, @class_date).deliver_now!
          render json: {message: 'Class Reminder email sent'}, status: :ok
        else
          render json: { message: CLASS_DETAILS_MISSING}
        end
      else
          render json: { message: NO_STUDENT_ERR}
      end
    end

    

    def student_class_changes
    	@email = params[:email]
     	@class_date = params[:class_date]
      @student = AccountBlock::Student.find_by(email: @email)
      if @student 
        if @class_date 
        StudentClassChangesMailer.student_class_changes(@student, @class_date).deliver_now!
          render json: {message: 'Class Changes email sent'}, status: :ok
        else
          render json: { message: CLASS_DETAILS_MISSING}
        end
      else
          render json: { message: NO_STUDENT_ERR}
      end
    end

  end
end