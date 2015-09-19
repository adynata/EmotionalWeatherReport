class FriendshipsController < ApplicationController
  before_filter :setup_friends

  def create
    friendship = Friendship.request(@user, @friend)
    flash[:notice] = "Friend request sent."
    redirect_to profile_for(@friend)
  end

  private

  def setup_friends
    @user = User.find(session[:user_id])
    @friend = User.find_by_id(params[:id])
  end



end
