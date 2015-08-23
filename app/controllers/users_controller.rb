class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    @liked_bookmarks = Bookmark.includes(:likes).where(likes: {user_id: @user})
  end

end
