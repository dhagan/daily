class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    #mail(to: @to, subject: 'Welcome to My Awesome Site')
=begin
    delivery_options = { user_name: 'dhagan111@gmail.com',
                         password: 'pl4pike',
                         address: 'smtp.gmail.com' }
    mail(to: 'djh_sup4@mailinator.com',
         subject: 'Please see the Terms and Conditions attached',
         delivery_method_options: delivery_options)
=end

  end
end
