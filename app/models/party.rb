class Party < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 25, minimum: 3 }
  validates :passphrase, presence: true
  validates :url, presence: true, uniqueness: true

  before_validation :generate_url

  def generate_url
    url = SecureRandom.alphanumeric(10)
    Party.exists?(url:) ? generate_url : url
  end
end
