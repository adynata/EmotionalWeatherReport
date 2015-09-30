module FriendshipsHelper

  def friendship_status(user,friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    return ("#{friend.name} is not your friend as of yet.") if friendship.nil?
    case friendship.status
    when 'requested'
      return ("#{friend.name} would like to be friends with you.")
    when 'pending'
      return ("You've requested friendship with #{friend.name}.")
    when 'accepted'
      return ("#{friend.name} is your friend.")
    end
  end


end
