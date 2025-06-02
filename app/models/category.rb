class Category < ApplicationRecord
  has_many :quotes

  before_save :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = name.parameterize if name.present?
  end
end
