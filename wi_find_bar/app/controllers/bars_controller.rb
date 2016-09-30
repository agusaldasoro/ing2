class BarsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    bars_scope = filter if (filter_options.present? && any_valid?) ||
                           params_for_distance_range?
    bars_scope ||= BarAgency.new.search_all_bars
    @bars = smart_listing_create :bars, bars_scope, partial: 'bars/list',
                                                    default_sort: { name: 'asc' }
  end

  def show
    @bar = Bar.find(params[:id])
  end

  private

  def filter_options
    @filter_options ||= params[:filter_options]
  end

  def filter_distance
    @filter_distance ||= params[:filter_distance]
  end

  def params_for_distance_range?
    return false unless filter_distance.present?
    filter_distance[:address].present? && filter_distance[:distance].present?
  end

  def any_valid?
    filter_options.each do |_key, value|
      return true if value.present?
    end
    false
  end

  def filter
    BarAgency.new.search_and_filter(filters)
  end

  def filters
    res = []
    filter_by_characteristics(res) if filter_options.present?
    filter_by_distance(res) if params_for_distance_range?
    res
  end

  def filter_by_characteristics(res)
    filter_options.each do |key, value|
      res << FilterByCharacteristic.new(key.classify.constantize.new(value: value)) if
        value.present?
    end
  end

  def filter_by_distance(res)
    res << FilterByDistance.new(filter_distance[:distance].to_f, filter_distance[:address])
  end
end
