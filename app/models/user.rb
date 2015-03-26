class User < ActiveRecord::Base
  
  has_many :tweets
  has_many :retweets
  has_many :likes

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :image
  validates_integrity_of :image
  validates_processing_of :image
  
  def create
    @user = User.new(user_params)
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_cofirmation, :username, :user_id, :image, :remember_me, :image_cache, :remove_image)
  end

end
