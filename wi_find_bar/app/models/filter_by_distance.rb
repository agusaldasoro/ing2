class FilterByDistance < Filter
  attr_accessor :distance, :address

  def initialize(distance, address)
    @distance = distance
    @address = address
  end

  def check(bar)
    Maps.new.distance_from_to(address, bar.address) <= distance
  end
end
