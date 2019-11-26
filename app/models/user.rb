class User < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true

  validates :name,  presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[\W_])[!-~]+\z/i
  has_secure_password
  validates :password, presence: true, length: { in: 8..32},
                      format: { with: VALID_PASSWORD_REGEX }
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end

