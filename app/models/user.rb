class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :password, :password_confirmation, :login, :email

  has_one :profile, :dependent => :destroy

  def self.has_permission(name)
    if current_user.role.permissions.map{|permission| permission.name}.include?(name)
      return true
    else
      return false
    end
  end

  def activation_instructions
    reset_perishable_token!
    UserMailer.activation(self).deliver
  end

  def welcome
    reset_perishable_token!
    UserMailer.welcome(self).deliver
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end

  def full_name
    self.login.to_s.capitalize
  end

  # To delete reset code after reset the user's password
  def delete_reset_code
    self.login_count = 0
    self.failed_login_count = 0
    self.password_reset_code = nil
    save(:validate => false)
  end

  # Will create reset code to a user
  def create_reset_code
    @reset = true
    self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    save(:validate => false)
  end

end
