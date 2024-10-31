class Buzz < ApplicationRecord
  belongs_to :group

  def buzz!
    self.clicked = true
    save
  end

  def self.reset_buzzs
    all.each { |buzz| buzz.update(clicked: false) }
  end
end
