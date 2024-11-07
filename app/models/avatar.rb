class Avatar < ApplicationRecord
  has_one :group
  belongs_to :party

  validates :filename, presence: true

  def available
    where(taken: false)
  end

  def taken?
    taken
  end

  def take
    update(taken: true)
  end

  def release
    update(taken: false)
  end
end
