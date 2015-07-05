class LikesController < ApplicationController
  
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like
    
    if like.save
      flash[:notice] = "You liked this bookmark!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:error] = "Something went wrong.  Try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = @bookmark.likes.find(params[:id])
    authorize like
    
    if like.destroy
      flash[:notice] = "Bookmark un-liked."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:error] = "Something went wrong. Try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
  
end
