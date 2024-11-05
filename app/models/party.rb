class Party < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :buzzs, through: :groups

  validates :name, presence: true, uniqueness: true, length: { maximum: 25, minimum: 3 }
  validates :passphrase, presence: true
  validates :url, presence: true, uniqueness: true

  before_validation :generate_url

  def generate_url
    loop do
      self.url = SecureRandom.alphanumeric(10)
      break unless Party.exists?(url:)
    end
  end

  def ranked_groups
    return groups.sort_by(&:score).reverse
  end

  def next_round
    buzzs.each(&:new_round)
  end

  def next_try
    buzzs.each(&:retry)
  end

  def disable_buzzs
    buzzs.each(&:disable)
  end
end
