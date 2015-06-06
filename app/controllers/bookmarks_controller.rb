class Topics::BookmarksController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic
    
    if @bookmark.save
      flash[:notice] = "Bookmark was saved!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "There was an error saving the bookmark.  Please try again."
      render :new
    end
  end

  def edit
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url, :title)
  end
end
