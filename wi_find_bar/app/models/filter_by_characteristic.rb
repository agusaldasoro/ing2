class FilterByCharacteristic < Filter
  attr_accessor :characteristic

  def initialize(characteristic)
    @characteristic = characteristic
  end

  def check(bar)
    bar.characteristics.each do |c|
      return true if characteristic.type == c.type && characteristic.value == c.value
    end
    false
  end
end
