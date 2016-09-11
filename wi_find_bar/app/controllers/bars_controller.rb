class BarsController < ApplicationController
  def index
    @bars = Bar.filter(params.slice(:wifi))
    @bars = @bars.in_range(params[:distance], place) if params[:distance].present?
  end

  private

  def place
    @place = params[:address] || [params[:lat], params[:long]]
  end
end
