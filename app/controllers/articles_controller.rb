class ArticlesController < ApplicationController

  def index
    @articles = Article.find(:all)
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(:article => @article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article
      flash[:notice] = "Successfully created article."
    else
      flash[:error] = "Error while creating article"
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article"
      redirect_to @article
    else
      flash[:error] = "Error while updating, plz try again..."
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_path
  end
end
