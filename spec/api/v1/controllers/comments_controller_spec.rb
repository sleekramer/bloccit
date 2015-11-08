require 'rails_helper'
include RandomData

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:my_user) {create(:user)}
  let(:my_topic) {create(:topic)}
  let(:my_post) {create(:post, topic: my_topic, user: my_user)}
  let(:comment) {my_post.comments.create!(body: RandomData.random_sentence, user: my_user)}

  context "unauthenticated user" do
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET show" do
      it "returns http success" do
        get :show, id: comment.id
        expect(response).to have_http_status(:success)
      end
    end
  end
  context "unauthorized user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET show" do
      it "returns http success" do
        get :show, id: comment.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
