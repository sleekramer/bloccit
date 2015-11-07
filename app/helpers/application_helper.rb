module ApplicationHelper

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
  def disable_if_upvoted(user, post)
    if user.votes.find_by_post_id(post.id).value == 1
      'disabled'
    else
      ''
    end
  end
  def disable_if_downvoted(user, post)
    if user.votes.find_by_post_id(post.id).value == -1
      'disabled'
    else
      ''
    end
  end

end
