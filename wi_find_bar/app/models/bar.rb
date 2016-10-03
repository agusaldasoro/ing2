class Bar < ApplicationRecord
  has_many :characteristics

  validates :name, presence: true

  def address
    Address.find_by_bar_id(id)
  end
end
