class FilterByHasCharacteristic < Filter
  attr_accessor :characteristic

  def initialize(characteristic)
    @characteristic = characteristic
  end

  def check(bar)
    char = characteristic.type.constantize.find_by_bar_id(bar.id)
    return false unless char.present?
    char.value == characteristic.value
  end
end
