class User < ApplicationRecord
  has_secure_password

  has_many :favorites
  has_many :favorite_quotes, through: :favorites, source: :quote

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
