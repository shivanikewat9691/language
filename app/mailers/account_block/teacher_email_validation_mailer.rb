module AccountBlock
  class TeacherEmailValidationMailer < ApplicationMailer
	
      def teacher_email_validation(teacher, host, client_url)
      @teacher = teacher
      @host = host
      @client_url = client_url
      token = encoded_token

      @url = "#{@host}/account_block/teachers/activate_account?token=#{token}&client_url=#{@client_url}"
      attachments.inline["lingoamojr.png"] = File.read("#{Rails.root}/app/assets/images/lingoamojr.png")

      mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Account activation') do |format|
        format.html { render 'teacher_email_validation' }
      end
    end

    private

    def encoded_token
      BuilderJsonWebToken.encode @teacher.id, 60.minutes.from_now
    end
  end
end