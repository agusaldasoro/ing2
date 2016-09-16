class BarsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    if filter_options.present?
      bars_scope = Bar.filter(filter_options.slice(:wifi))
      bars_scope = bars_scope.in_distance_range(filter_options[:distance], place) if
        filter_options[:distance].present?
    end
    bars_scope ||= Bar.all
    @bars = smart_listing_create :bars, bars_scope, partial: 'bars/list',
                                                    default_sort: { name: 'asc' }
  end

  private

  def place
    @place = filter_options[:address] || [filter_options[:lat], filter_options[:lng]]
  end

  def filter_options
    @filter_options ||= params[:filter_options]
  end
end
