class Avatar < ApplicationRecord
  has_one :group
  validates :filename, presence: true

  def self.available
    where(taken: false)
  end

  def self.taken
    where(taken: true)
  end

  def take
    update(taken: true)
  end

  def release
    update(taken: false)
  end
end
