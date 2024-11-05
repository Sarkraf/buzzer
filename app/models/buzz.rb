class Buzz < ApplicationRecord
  belongs_to :group
  has_one :party, through: :group

  scope :last_buzzed, -> { order(time: :desc).first }

  def buzz!
    update(clicked: true, time: Time.now)
  end

  def retry
    update(clickable: true) unless clicked
    broadcast_update("retry")
  end

  def new_round
    update(clickable: true, clicked: false)
    broadcast_update("new_round")
  end

  def disable
    update(clickable: false)
    broadcast_update("disable")
  end

  def broadcast_update(action = nil)
    action ||= "update"
    BuzzChannel.broadcast_to(self, { action:, buzz: self })
  end
end
