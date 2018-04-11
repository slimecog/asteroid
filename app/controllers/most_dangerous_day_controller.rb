class MostDangerousDayController < ApplicationController
  def index
    @asteroids = AsteroidSearch.new(params[:start_date], params[:end_date]).neos
  end
end
