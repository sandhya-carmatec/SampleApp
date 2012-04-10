class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  def new
    @user = User.new
    render :layout => false
  end

  def signup
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(params[:user])
    if @user.errors.empty? and @user.save_without_session_maintenance
      @user.activation_instructions
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to '/'
    else
      flash[:error] = "Error while creating account, plz try again.."
      render :action => :new,:layout => false
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    #    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to manage_role_users_path
    else
      render :action => :edit
    end
  end

  def activate
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise  Exception)
    @user.active = true
    if @user
      flash[:notice] = "Your account has been activated!"
      UserSession.create(@user) # Log user in manually
      @user.welcome
      flash[:notice] = "Account activated!"
      redirect_to '/'
    else
      render :action => :new
      render :layout => false
    end
  end
end
