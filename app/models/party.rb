class Party < ApplicationRecord
  has_many :groups, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 25, minimum: 3 }
  validates :passphrase, presence: true
  validates :url, presence: true, uniqueness: true

  before_validation :generate_url

  def generate_url
    self.url = SecureRandom.alphanumeric(10)
  end
end
