class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(from: "metislab201@gmail.com", to: @user.email,
             subject: "Bienvenue chez Pilea !")
    end 
end
