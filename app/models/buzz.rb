class Buzz < ApplicationRecord
  belongs_to :group

  def buzz!
    self.clicked = true
    save
  end

end
