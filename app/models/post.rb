class Post < ActiveRecord::Base

  belongs_to :user

  validates :title,
            presence: true,
            length: { maximum: 200 }
  validates :content,
            presence: true,
            length: { maximum: 50000 }
end
