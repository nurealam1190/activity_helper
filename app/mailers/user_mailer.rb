class UserMailer < ActionMailer::Base
 default from: 'bigcolors@akaruilabs.com'
 
  def welcome_email(user, from_user)
    @user = user
    @from=from_user
    
    mail(to:@user.email, subject: 'Would u like to be my friends')
  end
end
