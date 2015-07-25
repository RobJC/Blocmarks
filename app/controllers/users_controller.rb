class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    @liked_bookmarks = @user.likes.map { |like| like.bookmark }
  end

end
