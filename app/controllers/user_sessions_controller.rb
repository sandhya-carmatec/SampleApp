class UserSessionsController < ApplicationController
  layout false
  def new
    @user_session = UserSession.new
    render :layout => false
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to home_index_path
    else
      render :action => :new, :layout => false
    end
  end

  def destroy
    current_user_session.destroy
    session[:logged] = nil
    flash[:notice] = "Logout successful!"
    redirect_to new_user_session_path
  end


  # Function allowing to reset user's password by email in case of  he/she forgets
  #
  # Usage URL
  #
  # /forgot_password
  def forgot_password
    if request.post?
      @user = User.where(:email => params[:user][:email]).first
      begin
        @user = User.where(:email => params[:user][:email]).first
      rescue Exception => e
      end
      if @user
        if @user.create_reset_code && UserMailer.reset_password(@user).deliver
          flash[:notice] = 'Please check your email. we sent instruction to reset your password.'
        else
          flash[:error]= "Error occured while requesting forgot password. Please try later."
        end
      else
        if !params[:user][:email].blank?
          flash[:error]= "No user exist with email address '#{params[:user][:email]}'"
        else
          flash[:error]= "Please enter email address to reset password."
        end
      end
      render :action => "forgot_password", :layout => false
    end
  end          

  def reset_password
    @reset_code = params[:reset_code]
    if (@user = User.find_by_password_reset_code(params[:reset_code]) )
      if request.post?
        @user.errors.add(:password,"can't be blank.") if params[:user].nil? or params[:user][:password].blank?
        @user.errors.add(:password_confirmation,"can't be blank.") if params[:user].nil? or params[:user][:password_confirmation].blank?
        if @user.errors.empty? && @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
          @user.delete_reset_code
          flash[:notice] = "Password successfully changed."
          redirect_to login_path
        else
          flash[:error] = "Password reset failed. Please try again."
          render :action => "reset_password"
        end
      end
    else
      flash[:error] = "Invalid Link"
      redirect_to "/login"
    end
  end

end
