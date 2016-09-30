class FilterByDistance < Filter
  attr_accessor :distance, :address

  def initialize(distance, address)
    @distance = distance
    @address = address
  end

  def check(bar)
    bar.address.distance_to(address, units: :kms) <= distance
  end
end
