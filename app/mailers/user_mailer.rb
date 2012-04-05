
class UserMailer < ActionMailer::Base
  default :from => "noreply@expressions.com.sg"
  default_url_options[:host] = "localhost:3001"

  def activation(user)
    @user = user
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://localhost:3001/activate/#{user.perishable_token}"
    #    mail :to => user.email, :body => "http://localhost:3001/activate/#{user.perishable_token}",  :sent_on => Time.now,  :subject => "Activation Instructions",  :from => "noreply@binarylogic.com"
  end

  def welcome(user)
    @user = user
    setup_email(user)
    @subject = "Welcome to the site!"
    @body  =  "http://localhost:3001"
  end

#  def password_reset_instructions(user)
#    subject      "Password Reset Instructions"
#    from         "noreply@sampleapp.com.sg"
#    recipients   user.email
#    content_type "text/html"
#    sent_on      Time.now
#    #    password  user.crypted_password
#    body :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
#  end

  # Will send email with reset password url to a user
  def reset_password(user)
    @url =  "http://localhost:3001/reset_password/#{user.password_reset_code}"
    @user = user
    mail(:from => "noreply@sampleapp.com", :to => @user.email, :subject => " Sampleapp password reset instructions")
  end




  protected
  def setup_email(user)
    @recipients  = "#{user.email}"
    #   @password = "#{user.crypted_password}"
    @from        = "noreply@sampleapp.com.sg"
    @subject     = "[agentrefund] - "
    @sent_on     = Time.now
    @body[:user] = user
  end
end