class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    #@liked_bookmarks = @user.likes.map { |like| like.bookmark }
    @liked_bookmarks = User.includes(:likes).where("likes.id").references(:likes).find(current_user)
    #@liked_bookmarks = Like.includes(:bookmark).where("likes.current_user = true").references(:likes)
  end

end
