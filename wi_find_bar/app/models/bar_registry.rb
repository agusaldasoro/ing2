class BarRegistry
  def all_approved_bars
    Bar.all
  end

  def bar_by_name(bar_name)
    Bar.find_by(name: bar_name)
  end
end
