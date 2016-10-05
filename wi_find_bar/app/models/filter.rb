class Filter
  attr_accessor :validators

  def initialize(validators)
    @validators = validators
  end

  def check(bar)
    validators.each do |v|
      return false unless v.check(bar)
    end
    true
  end
end
