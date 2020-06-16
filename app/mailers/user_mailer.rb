class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(from: "metislab201@gmail.com", to: @user.email,
             subject: "Bienvenue chez Pilea !")
    end 

    def premailer(message)
        message.text_part.body = Premailer.new(message.text_part.body.to_s, with_html_string: true).to_plain_text
        message.html_part.body = Premailer.new(message.html_part.body.to_s, with_html_string: true).to_inline_css
      
        return message
    end     
end
