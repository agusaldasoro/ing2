class Cartographer
  def distance_from_to(from, to)
    to.distance_to(from, units: :kms)
  end

  def show_map(address)
    "http://maps.google.com/maps/api/staticmap?size=2000x2000&markers=color:blue|label:A|
    #{address}&key=AIzaSyD3KTrkOMrIxA95d-QOnfyaofqRRpoAEd8"
  end
end
