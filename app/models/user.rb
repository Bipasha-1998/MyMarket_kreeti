class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :products, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :username, presence: true,
                    length: { minimum: 3, maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
                       
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def self.digest(string)
    if ActiveModel::SecurePassword.min_cost 
      cost = BCrypt::Engine::MIN_COST
    else
      cost = BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end
end
