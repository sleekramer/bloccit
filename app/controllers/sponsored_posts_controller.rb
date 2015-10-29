class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])
    @sponsored_post.topic = @topic

    if @sponsored_post.save
      redirect_to [@topic, @sponsored_post], notice: "Sponsored post was saved."
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]

    if @sponsored_post.save
      redirect_to [@sponsored_post.topic, @sponsored_post], notice: "Sponsored post was saved."
    else
      flash[:error] = "There was an error updating the post. Please try again."
      render :edit
    end
  end

  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])

    if @sponsored_post.destroy
      redirect_to @sponsored_post.topic, notice: "\"#{@sponsored_post.title}\" was deleted."
    else
      flash[:error] = "There was an error deleting the post. Please try again."
      render :show
    end
  end
end
