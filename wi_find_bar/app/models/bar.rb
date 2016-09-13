class Bar < ApplicationRecord
  include Filterable
  has_one :location

  validates :name, presence: true
  validates :wifi, inclusion: [true, false]

  acts_as_mappable through: :location

  scope :wifi, -> (has_wifi) { where(wifi: has_wifi) }
  scope :in_distance_range, lambda { |distance, place|
    joins(:location).within(distance, origin: place, units: :kms)
  }
end
