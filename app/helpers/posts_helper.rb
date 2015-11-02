module PostsHelper
  def user_is_authorized_for_post?(post)
    current_user && (current_user.admin? || current_user == post.user)
  end
end
