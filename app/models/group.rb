class Group < ApplicationRecord
  belongs_to :party
  belongs_to :avatar
  has_one :buzz, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }, uniqueness: { scope: :party_id }
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :avatar, uniqueness: { scope: :party_id }

  before_validation :set_score_to_zero, if: :new_record?
  after_create :create_buzz

  GROUPS = Group.all

  def set_score_to_zero
    self.score = 0
  end

  def update_score(operator, score)
    self.score = self.score.send(operator, score.to_i)
    save
  end

  def create_buzz
    Buzz.create!(group: self, clickable: false)
  end
end
