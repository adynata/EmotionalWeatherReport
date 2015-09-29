class FriendshipsController < ApplicationController
  before_filter :setup_friends

  def create
    friendship = Friendship.request(@user, @friend)
    flash[:notice] = "Friend request sent."
    # redirect_to profile_for(@friend)
  end
    

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.screen_name} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.screen_name}."
    end
  end

  def decline
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.screen_name} declined"
    else
      flash[:notice] = "No friendship request from #{@friend.screen_name}."
    end
  end

  def cancel
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship request canceled."
    else
      flash[:notice] = "No request for friendship with #{@friend.screen_name}"
    end
  end

  def delete
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.screen_name} deleted!"
    else
      flash[:notice] = "You aren't friends with #{@friend.screen_name}"
    end
  end

  private

  def setup_friends
    @user = User.find(session[:user_id])
    @friend = User.find_by_id(params[:id])
  end



end
