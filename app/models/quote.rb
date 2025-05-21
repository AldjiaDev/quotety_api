class Quote < ApplicationRecord
  belongs_to :author
  belongs_to :category

  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
end
