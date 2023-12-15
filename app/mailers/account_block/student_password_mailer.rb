module AccountBlock
  class StudentPasswordMailer < ApplicationMailer

  def student_password_reset(student, host, client_url)
    @student = student
    @host = host
    @client_url= client_url
    token = encoded_token

     @url = "#{@client_url}/StudentNewPassword?token=#{token}&host=#{@chost}"
      attachments.inline["lingoamojr.png"] = File.read("#{Rails.root}/app/assets/images/lingoamojr.png")
         mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Password Reset') do |format|
        format.html { render 'student_password_reset' }
      end
    end

    private

    def encoded_token
      BuilderJsonWebToken.encode @student.id, 10.minutes.from_now
    end
    
  end
end