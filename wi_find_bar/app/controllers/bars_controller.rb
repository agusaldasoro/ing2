class BarsController < ApplicationController
  def index
    @bars = Bar.filter(params.slice(:wifi))
  end
end
