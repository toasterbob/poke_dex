class UserMailer < ApplicationMailer
  default from: 'cats@99cats.com'

  def welcome_email(user)
    mail(to: "mark.noizumi@gmail.com", subject: "YOU ARE A CHUMP!")
  end
end


#https://github.com/appacademy/curriculum/blob/master/rails/readings/mailing-1.md
