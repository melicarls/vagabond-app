class City < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: true

  validates :photo,
            presence: true,
            uniqueness: true

  def self.search(search)
      where('name iLIKE ?', "%#{search}%")
  end

end
