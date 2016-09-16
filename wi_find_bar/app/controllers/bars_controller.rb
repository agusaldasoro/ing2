class BarsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    bars_scope = add_scopes if filter_options.present?
    bars_scope ||= Bar.all
    @bars = smart_listing_create :bars, bars_scope, partial: 'bars/list',
                                                    default_sort: { name: 'asc' }
  end

  private

  def place
    @place = filter_options[:address]
  end

  def filter_options
    @filter_options ||= params[:filter_options]
  end

  def add_scopes
    bars_scope = Bar.filter(filter_options.slice(:wifi))
    return bars_scope unless params_for_distance_range?
    bars_scope.in_distance_range(filter_options[:distance], place)
  end

  def params_for_distance_range?
    filter_options[:address].present? && filter_options[:distance].present?
  end
end
