class FilterByDistance < Filter
  attr_accessor :address, :distance

  def initialize(address, distance)
    @address = address
    @distance = distance
  end

  def check(bar)
    Cartographer.new.distance_from_to(address, bar.address) <= distance
  end
end
