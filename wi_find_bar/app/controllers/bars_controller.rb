class BarsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    bars_scope = filter if should_filter?
    bars_scope ||= PublicBarAgency.new.search_all_bars
    @bars = smart_listing_create :bars, bars_scope, partial: 'bars/list',
                                                    default_sort: { name: 'asc' }
  end

  def show
    @bar = PublicBarAgency.new.search_bar_by_name(params[:name])
  end

  private

  def should_filter?
    include_filter?(filter_has) || include_filter?(filter_greater) ||
      include_filter?(filter_less) || params_for_distance_range?
  end

  def include_filter?(filter_name)
    filter_name.present? && any_valid?(filter_name)
  end

  def filter
    PublicBarAgency.new.search_and_filter(Filter.new(validators))
  end

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

  def validators
    res = []
    validator_by_characteristics(res, filter_has, BarHasCharacteristic) if
      filter_has.present?
    validator_by_characteristics(res, filter_greater, BarCharacteristicsGreater) if
      filter_greater.present?
    validator_by_characteristics(res, filter_less, BarCharacteristicsLess) if
      filter_less.present?
    validator_by_distance(res) if params_for_distance_range?
    res
  end

  def validator_by_characteristics(res, filter_option, klass)
    filter_option.each do |key, value|
      res << klass.new(key.classify.constantize.new(value: value)) if
        value.present?
    end
  end

  def validator_by_distance(res)
    res << ValidatorByDistance.new(filter_distance[:address], filter_distance[:distance].to_f)
  end
end
