class Maps
  def distance_from_to(from, to)
    to.distance_to(from, units: :kms)
  end
end
