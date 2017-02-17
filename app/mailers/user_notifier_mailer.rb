class UserNotifier < ActionMailer::Base
  default :from => 'example@examplecom'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  # sc note that send email on sign-up does not appear to be working but contact us form does
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
