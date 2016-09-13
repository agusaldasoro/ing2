class Location < ApplicationRecord
  belongs_to :bar

  acts_as_mappable default_units: :kms,
                   lat_column_name: :lat,
                   lng_column_name: :lng

  # if lat and lng are setted, then there's no need to geocode (isn't too accurate)
  after_create :geocode_address, if: -> { address.present? && lat.blank? && lng.blank? }

  private

  def geocode_address
    geo = Geokit::Geocoders::MultiGeocoder.geocode(address)
    update_attributes(lat: geo.lat, lng: geo.lng)
  end
end
