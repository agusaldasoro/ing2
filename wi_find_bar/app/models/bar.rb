class Bar < ApplicationRecord
  include Filterable
  acts_as_mappable default_units: :kms,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  scope :wifi, -> (has_wifi) { where(wifi: has_wifi) }
  scope :in_range, -> (distance, place) {
    within(distance, origin: place,
                     units: :kms)
  }
end
