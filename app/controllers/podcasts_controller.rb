class PodcastsController < ApplicationController
  before_action :find_podcast, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @podcasts = Podcast.all.order("created_at DESC")
  end

  def show
  end

  def new
    @podcast = current_user.podcasts.build
  end

  def create
    @podcast = current_user.podcasts.build(podcast_params)

    if @podcast.save
      redirect_to @podcast, notice: "Sucessfully created new Podcast"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @podcast.update(podcast_params)
       redirect_to @podcast, notice: "Podcast was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @podcast.destroy
    redirect_to root_path
  end

  def upvote
    @podcast.upvote_by current_user
    redirect_to :back
  end


  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :image)
  end

  def find_podcast
    @podcast = Podcast.find(params[:id])
  end
end
