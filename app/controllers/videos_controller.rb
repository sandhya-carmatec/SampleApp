class VideosController < ApplicationController
  #Display all videos
  #url: GET    /:video_type/videos
  def index
    @videos = Video.where("video_type = '#{params[:video_type]}'").order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  #url: GET    /:video_type/videos/new
  def new
    @video = Video.new
  end

  #Create new video
  #url:  POST   /:video_type/videos
  def create
    @video = Video.new(params[:video])
    @video.video_type = params[:video_content_type]
    if @video.save
      @video.convert
      flash[:notice] = 'Video has been uploaded'
      redirect_to videos_path(params[:video_type])
    else
      render :action => 'new'
    end
  end

  #method to delete video
  #url: /:video_type/videos/:id
  def destroy
    @video = Video.find(params[:id])
    if @video.destroy
      flash[:notice] = "successfully deleted the video"
    else
      flash[:error] = "Couldn't delete the video, please try again."
    end
    redirect_to videos_path(params[:video_type])
  end

  def show
    @video = Video.find(params[:id])
    @videos = Video.where("video_type = '#{params[:video_type]}'").order("created_at DESC").limit(10)
  end
end
