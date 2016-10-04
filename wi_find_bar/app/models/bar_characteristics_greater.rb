class BarCharacteristicsGreater < BarCompareCharacteristic
  attr_accessor :characteristic

  def initialize(characteristic)
    @characteristic = characteristic
  end

  def check(bar)
    bar_characteristic = characteristic.type.constantize.find_by_bar_id(bar.id)
    return false unless bar_characteristic.present?
    bar_characteristic.value.to_f >= characteristic.value.to_f
  end
end
