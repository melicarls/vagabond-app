class City < ActiveRecord::Base
  has_many :posts

  validates :name,
            presence: true,
            uniqueness: true

  validates :photo,
            presence: true,
            uniqueness: true
end
