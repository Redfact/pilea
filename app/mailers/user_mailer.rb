class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(from: "metislab201@gmail.com", to: @user.email,
             subject: "Bienvenu chez Pilea")
    end 
end
