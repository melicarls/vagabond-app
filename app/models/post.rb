class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :city, through: :cities_posts

  validates :title,
            presence: true,
            length: { maximum: 200 }
  validates :content,
            presence: true,
            length: { maximum: 50000 }
end
