class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :quote

  validates :user_id, uniqueness: { scope: :quote_id }
end
