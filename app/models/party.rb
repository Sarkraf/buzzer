class Party < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :buzzs, through: :groups
  has_many :avatars, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 25, minimum: 3 }
  validates :passphrase, presence: true
  validates :url, presence: true, uniqueness: true

  before_validation :generate_url
  after_create :initialize_avatars

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

  def available_avatars
    avatars.where(taken: false)
  end

  private

  def initialize_avatars
    Dir.glob(Rails.root.join('app', 'assets', 'images', 'avatars', '*')).each do |file|
      file_name = file.split('/').last
      Avatar.create!(filename: file_name, party: self) unless file_name == "fred.png"
    end
  end
end
