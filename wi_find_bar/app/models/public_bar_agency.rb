class PublicBarAgency
  def search_all_bars
    BarRegistry.new.all_approved_bars
  end

  def search_and_filter(filters)
    bars = search_all_bars.to_a
    filters.each do |filter|
      bars = bars.select { |bar| filter.check(bar) }
    end
    Bar.where(id: bars.map(&:id))
  end
end
