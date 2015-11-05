class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  scope :visible_to, -> (user) {user ? all : publicly_viewable}
  scope :privately_viewable, -> {where(public: false)}
  scope :publicly_viewable, -> {where(public: true)}
end
