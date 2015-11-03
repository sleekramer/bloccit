require 'rails_helper'

RSpec.describe Rating, type: :model do

  it { should have_many :posts}
  it { should have_many :topics}

  describe ".update_rating" do
    it "takes a severity string and return a rating with that severity" do
      rating_string = 'PG'
      rating = Rating.create!(severity: 'PG')
      expect(Rating.update_rating(rating_string)).to eq(rating)
    end
  end
end
