class BarAgency
  def search_all_bars
    Bar.all
  end

  def search_and_filter(filters)
    bars = Bar.all.to_a
    filters.each do |filter|
      bars = bars.select { |bar| filter.check(bar) }
    end
    Bar.where(id: bars.map(&:id))
  end
end
