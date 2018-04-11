class MostDangerousDayController < ApplicationController
  def index
    @asteroids = NASAAsteroids.new(params[:start_date], params[:end_date]).neos
  end
end
