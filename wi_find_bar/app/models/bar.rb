class Bar < ApplicationRecord
  has_many :characteristics

  validates :name, presence: true

  def address
    Address.find_by_bar_id(id)
  end

  def has_wifi
    HasWifi.find_by_bar_id(id)
  end
end
