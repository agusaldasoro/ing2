class Characteristic < ApplicationRecord
  belongs_to :bar

  validates :value, presence: true

  def value
    self[:value]
  end
end
