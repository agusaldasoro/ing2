class BarsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    bars_scope = filter if (filter_has.present? && any_valid?(filter_has)) ||
                           (filter_greater.present? && any_valid?(filter_greater)) ||
                           (filter_less.present? && any_valid?(filter_less)) ||
                           params_for_distance_range?
    bars_scope ||= PublicBarAgency.new.search_all_bars
    @bars = smart_listing_create :bars, bars_scope, partial: 'bars/list',
                                                    default_sort: { name: 'asc' }
  end

  def show
    @bar = Bar.find(params[:id])
  end

  private

  def filter_has
    @filter_has ||= params[:filter_has]
  end

  def filter_greater
    @filter_greater ||= params[:filter_greater]
  end

  def filter_less
    @filter_less ||= params[:filter_less]
  end

  def filter_distance
    @filter_distance ||= params[:filter_distance]
  end

  def params_for_distance_range?
    return false unless filter_distance.present?
    filter_distance[:address].present? && filter_distance[:distance].present?
  end

  def any_valid?(filter_option)
    filter_option.each do |_key, value|
      return true if value.present?
    end
    false
  end

  def filter
    PublicBarAgency.new.search_and_filter(filters)
  end

  def filters
    res = []
    filter_by_characteristics(res, filter_has, BarHasCharacteristic) if
      filter_has.present?
    filter_by_characteristics(res, filter_greater, BarCharacteristicsGreater) if
      filter_greater.present?
    filter_by_characteristics(res, filter_less, BarCharacteristicsLess) if
      filter_less.present?
    filter_by_distance(res) if params_for_distance_range?
    res
  end

  def filter_by_characteristics(res, filter_option, klass)
    filter_option.each do |key, value|
      res << klass.new(key.classify.constantize.new(value: value)) if
        value.present?
    end
  end

  def filter_by_distance(res)
    res << FilterByDistance.new(filter_distance[:address], filter_distance[:distance].to_f)
  end
end
