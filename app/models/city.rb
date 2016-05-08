class City < ActiveRecord::Base
  has_many :posts

  def self.search(search)
      where('name iLIKE ?', "%#{search}%")
  end

end
