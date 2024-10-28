class Group < ApplicationRecord
  belongs_to :party

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }, uniqueness: { scope: :party_id }
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_score_to_zero

  def set_score_to_zero
    self.score = 0
  end
end
