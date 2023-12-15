module AccountBlock
  class TeacherPasswordMailer < ApplicationMailer

  	def teacher_password_reset(teacher, host, client_url)
  		@teacher = teacher
      @host = host
      @client_url = client_url
      token = encoded_token
      @url = "#{@client_url}/TeacherNewPassword?token=#{token}&host=#{@host}"
      attachments.inline["lingoamojr.png"] = File.read("#{Rails.root}/app/assets/images/lingoamojr.png")
  	     mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Password Reset') do |format|
        format.html { render 'teacher_password_reset' }
      end
    end

    private
    def encoded_token
      BuilderJsonWebToken.encode @teacher.id, 10.minutes.from_now
    end
  end
end
