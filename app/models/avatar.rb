class Avatar < ApplicationRecord
  has_one :group
  belongs_to :party

  validates :filename, presence: true

  def taken?
    taken
  end

  def take
    update(taken: true)
  end

  def release
    update(taken: false)
  end

  def select
    GroupChannel.broadcast_to(party, { action: "avatar_selected", avatar: self })
  end
end
