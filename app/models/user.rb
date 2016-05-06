class User < ActiveRecord::Base

  has_many :city_posts
  has_many :posts, through: :cities_posts

  has_secure_password



  validates :first_name,
            presence: true,
            length: { maximum: 255 }


  validates :last_name,
            presence: true,
            length: { maximum: 255 }


  validates :current_city,
            presence: true,
            length: { maximum: 255 }



  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i



  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            length:     { maximum: 255 }


  validates :username,
            presence: true,
            uniqueness: true,
            length: { maximum: 255 }


  def self.confirm(params)
    @user = User.find_by({username: params[:username]})
    @user.try(:authenticate, params[:password])
  end


end
