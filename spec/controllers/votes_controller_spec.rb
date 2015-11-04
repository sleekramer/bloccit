require 'rails_helper'
include RandomData
include SessionsHelper

RSpec.describe VotesController, type: :controller do
  let(:my_user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld")}
  let (:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:other_user) {User.create!(name: RandomData.random_name, email: RandomData.random_email, password: "helloworld", role: :member)}
  let (:user_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: other_user)}
  let (:vote) { Vote.create!(value: 1)}

  context "guest" do
    describe "POST up_vote" do
      it "redirects the user to the sign in view" do
        post :up_vote, post_id: user_post.id
        expect(response).to redirect_to(new_session_path)
      end
    end
    describe "POST down_vote" do
      it "redirects the user to the sign in view" do
        post :down_vote, post_id: user_post.id
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  context "signed in user" do
    before do
      create_session(my_user)
      request.env["HTTP_REFERER"] = topic_post_path(my_topic, user_post)
    end

    describe "POST up_vote" do
      it "increases the number of post votes by one with users first vote" do
        votes = user_post.votes.count
        post :up_vote, post_id: user_post.id
        expect(user_post.votes.count).to eq(votes + 1)
      end

      it "doesn't increase the number of votes with users second vote" do
        post :up_vote, post_id: user_post.id
        votes = user_post.votes.count
        post :up_vote, post_id: user_post.id
        expect(user_post.votes.count).to eq(votes)
      end

      it "increases the sum of post votes by one" do
        points = user_post.points
        post :up_vote, post_id: user_post.id
        expect(user_post.points).to eq(points + 1)
      end

      it ":back redirects to posts show page" do
        request.env["HTTP_REFERER"] = topic_post_path(my_topic, user_post)
        post :up_vote, post_id: user_post.id
        expect(response).to redirect_to([my_topic, user_post])
      end

      it ":back redirects to posts topic show" do
        request.env["HTTP_REFERER"] = topic_path(my_topic)
        post :up_vote, post_id: user_post.id
        expect(response).to redirect_to(my_topic)
      end
    end

    describe "POST down_vote" do
      it "increases the number of post votes by one with users first vote" do
        votes = user_post.votes.count
        post :down_vote, post_id: user_post.id
        expect(user_post.votes.count).to eq(votes + 1)
      end

      it "doesn't increase the number of votes with users second vote" do
        post :down_vote, post_id: user_post.id
        votes = user_post.votes.count
        post :down_vote, post_id: user_post.id
        expect(user_post.votes.count).to eq(votes)
      end

      it "decreases the sum of post votes by one" do
        points = user_post.points
        post :down_vote, post_id: user_post.id
        expect(user_post.points).to eq(points - 1)
      end

      it ":back redirects to posts show page" do
        request.env["HTTP_REFERER"] = topic_post_path(my_topic, user_post)
        post :down_vote, post_id: user_post.id
        expect(response).to redirect_to([my_topic, user_post])
      end

      it ":back redirects to posts topic show" do
        request.env["HTTP_REFERER"] = topic_path(my_topic)
        post :down_vote, post_id: user_post.id
        expect(response).to redirect_to(my_topic)
      end
    end
  end
end
