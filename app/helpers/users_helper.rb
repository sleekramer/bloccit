module UsersHelper
  def user_has_posts_or_comments?(user)
    user.posts.count > 0 || user.comments.count > 0
  end
  def user_has_favorites?(user)
    user.favorites.count > 0
  end
end
