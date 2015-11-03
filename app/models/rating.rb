class Rating < ActiveRecord::Base
  has_many :topics
  has_many :posts
  
  def self.update_rating(rating_string)
    unless rating_string.nil? || rating_string.empty?
      rating = Rating.find_or_create_by(severity: rating_string)
    end
    rating
  end

  enum severity: [:PG, :PG13, :R]


end
