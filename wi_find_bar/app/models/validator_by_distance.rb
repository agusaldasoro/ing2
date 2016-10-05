class ValidatorByDistance < Validator
  attr_accessor :address, :distance

  def initialize(address, distance)
    @address = address
    @distance = distance
  end

  def check(bar)
    Cartographer.new.distance_between(address, bar.address) <= distance
  end
end
