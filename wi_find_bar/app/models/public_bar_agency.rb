class PublicBarAgency
  def search_all_bars
    BarRegistry.new.all_approved_bars
  end

  def search_and_filter(filter)
    bars = search_all_bars.to_a
    bars = bars.select { |bar| filter.check(bar) }
    Bar.where(id: bars.map(&:id))
  end

  def search_bar_by_name(bar_name)
    BarRegistry.new.bar_by_name(bar_name)
  end
end
