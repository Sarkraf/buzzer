class Buzz < ApplicationRecord
  belongs_to :group

  def buzz!
    self.clicked = true
    save

  def reset_buzzer
    Buzz.all.each { |buzz| buzz.update(clicked: false) }
  end
end
