class Buzz < ApplicationRecord
  belongs_to :group

  def reset_buzzer
    self.buzzed = false
    self.save
  end
end
