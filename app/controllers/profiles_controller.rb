class ProfilesController < ApplicationController
  before_filter :require_user
  #  def index
  #    @profile = Profile.all
  #  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = current_user.id
    if @profile.save
      flash[:notice] = "profile successfully created"
      redirect_to profile_path(@profile)
    else
      flash[:error] = "Error while creating, plz try again....... "
      render :action => "new"
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.user_id = current_user.id
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "your profile was successfully updated"
      redirect_to profile_path(@profile)
    else
      flash[:error] = "Error while updating your profile, Pls try again.. "
      render :action => "edit"
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if @profile.destroy
      flash[:notice] = "profile was successfully deleted"
    end
  end
end
