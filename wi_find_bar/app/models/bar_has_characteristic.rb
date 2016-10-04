class BarHasCharacteristic < FilterByCharacteristic
  attr_accessor :characteristic

  def initialize(characteristic)
    @characteristic = characteristic
  end

  def check(bar)
    bar_characteristic = characteristic.type.constantize.find_by_bar_id(bar.id)
    bar_characteristic.present? ? bar_characteristic.value == characteristic.value : false
  end
end
