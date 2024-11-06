class Avatar < ApplicationRecord
  has_one :group
  validates :filename, presence: true

  def self.available
    where(taken: false)
  end
end
