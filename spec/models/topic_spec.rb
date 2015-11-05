require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let (:topic) { create(:topic) }

  it { should have_many(:posts) }
  it { should have_many(:labelings)}
  it { should have_many(:labels).through(:labelings)}

  describe "attributes" do
    it "responds to name" do
      expect(topic).to respond_to(:name)
    end
    it "responds to description" do
      expect(topic).to respond_to(:description)

    end
    it "responds to public" do
      expect(topic).to respond_to(:public)
    end
    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end
end
