class Restaurant < ApplicationRecord
  before_validation :lower
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, acceptance: { accept: ["chinese", "italian", "japanese", "french", "belgian"] }

  private

  def lower
    self.category = category.downcase
  end

end
