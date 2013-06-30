class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :user_name, :email, :password, :password_confirmation
  
  validates_uniqueness_of :email
  
  before_save { |user| user.email = email.downcase }
  before_create { generate_token(:auth_token) }
  
  
  validates :user_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end  
end
