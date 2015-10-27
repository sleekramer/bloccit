class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each do |post|
      post.title = "SPAM" if post.id % 5 == 0
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
