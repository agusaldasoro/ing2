class Address < Characteristic
  acts_as_mappable default_units: :kms,
                   lat_column_name: :lat,
                   lng_column_name: :lng

  # if lat and lng are setted, then there's no need to geocode (isn't too accurate)
  after_create :geocode_address, if: -> { value.present? && lat.blank? && lng.blank? }

  # def value
  #   self[:value]
  # end

  private

  def geocode_address
    geo = Geokit::Geocoders::MultiGeocoder.geocode(value)
    update_attributes(lat: geo.lat, lng: geo.lng)
  end
end
